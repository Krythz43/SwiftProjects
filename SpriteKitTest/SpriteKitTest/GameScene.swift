//
//  GameScene.swift
//  SpriteKitTest
//
//  Created by Krithick Santhosh on 07/07/23.
//

import SpriteKit
import GameplayKit
import CoreMotion

// We need to be very precise with the type that SpriteKit wants

enum collisonType: UInt32 {
    case player = 1
    case playerWeapon = 2
    case enemy = 4
    case enemyWeapon = 8
}

class GameScene: SKScene, SKPhysicsContactDelegate {
    let motionManager = CMMotionManager()
    let player = SKSpriteNode(imageNamed: "player")
    let waves = Bundle.main.decode([Wave].self, from: "waves.json")
    let enemyTypes = Bundle.main.decode([EnemyType].self, from: "enemy-types.json")
    var lastAddedExplosion = SKEmitterNode()
    var isPlayerAlive = true
    var levelNumber = 0
    var waveNumber = 0
    
    var playerShield = 5
    
    let positions = Array(stride(from: -160, through: 160, by: 40))
    
    override func didMove(to view: SKView) {
        physicsWorld.gravity = .zero
        physicsWorld.contactDelegate = self
        if let paticles = SKEmitterNode(fileNamed: "Starfield") {
            paticles.position = CGPoint(x: 1080,y: 0)
            paticles.zPosition = -1
            paticles.advanceSimulationTime(60)
            addChild(paticles)
        }
        
        player.name = "player"
        player.position.x = frame.minX + 150
        player.zPosition = 1
        addChild(player)
        
        // All position in Sprite kit are measured from the middle
        
        player.physicsBody = SKPhysicsBody(texture: player.texture ?? SKTexture(),
                                           size: player.texture?.size() ?? CGSizeMake(0, 0))
        player.physicsBody?.categoryBitMask = collisonType.player.rawValue // whats your collision type
        player.physicsBody?.collisionBitMask = collisonType.enemy.rawValue | collisonType.enemyWeapon.rawValue // whhat you want to collide with
        player.physicsBody?.contactTestBitMask = collisonType.enemy.rawValue | collisonType.enemyWeapon.rawValue // what collisions do you want to be informed about
        player.physicsBody?.isDynamic = false
        
        motionManager.startAccelerometerUpdates()
    }
    
    override func update(_ currentTime: TimeInterval) {
        if let accelerometer = motionManager.accelerometerData {
            player.position.y += CGFloat(accelerometer.acceleration.x * 50)
            
            if player.position.y < frame.minY / 2 {
                player.position.y = frame.minY / 2
            } else if player.position.y > frame.maxY / 2 {
                player.position.y = frame.maxY / 2
            }
            print("player y position: \(player.position.y)")
        }
        for child in children {
            if child.frame.maxX < 0 {
                if !frame.intersects(child.frame) { // if its less than half way and out of screen remove it
                    child.removeFromParent()
                }
            }
            
            if child.frame.maxX > 2*frame.maxX {
                if !frame.intersects(child.frame) { // if its less than half way and out of screen remove it
                    child.removeFromParent()
                }
            }
            
            let activeEnemies = children.compactMap {$0 as? EnemyNode}
            
            if activeEnemies.isEmpty {
                createWave()
            }
            
            for enemy in activeEnemies {
                guard frame.intersects(enemy.frame) else {continue}
                
                if enemy.lastFireTime + 1 < currentTime {
                    enemy.lastFireTime = currentTime
                    
                    if Int.random(in: 0...6) == 0 {
                        enemy.fire()
                    }
                }
            }
        }
    }
    
    
    func createWave () {
        guard isPlayerAlive else { return }
        
        if waveNumber == waves.count {
            levelNumber += 1
            waveNumber = 0
        }
        
        let currentWave = waves[waveNumber]
        waveNumber += 1
        
        let maximumEnemyType = min(enemyTypes.count, levelNumber + 1)
        let enemyType = Int.random(in: 0 ..< maximumEnemyType)
        
        let enemyOffsetX: CGFloat = 100
        let enemyStartX = 300
        
        if currentWave.enemies.isEmpty {
            for (index,position) in positions.shuffled().enumerated(){
                let enemy = EnemyNode(type: enemyTypes[enemyType], startPosition: CGPoint(x: enemyStartX, y: position), xOffset: enemyOffsetX*CGFloat(index * 3), moveStraight: true)
            }
        } else {
            for enemy in currentWave.enemies {
                let node = EnemyNode(type: enemyTypes[enemyType], startPosition: CGPoint(x: enemyStartX, y: positions[enemy.position]), xOffset: enemyOffsetX*enemy.xOffset, moveStraight: enemy.moveStraight)
                
                addChild(node)
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard isPlayerAlive else { return }
        
        let shot = SKSpriteNode(imageNamed: "playerWeapon")
        shot.name = "playerWeapon"
        shot.position = player.position
        
        shot.physicsBody = SKPhysicsBody(rectangleOf: shot.size)
        shot.physicsBody?.categoryBitMask = collisonType.playerWeapon.rawValue
        shot.physicsBody?.collisionBitMask = collisonType.enemy.rawValue | collisonType.enemyWeapon.rawValue
        shot.physicsBody?.contactTestBitMask = collisonType.enemy.rawValue | collisonType.enemyWeapon.rawValue
        
        addChild(shot)
        
        let movement = SKAction.move(to: CGPoint(x: 2000, y: shot.position.y), duration: 5)
        let sequence = SKAction.sequence([movement, .removeFromParent()])
        shot.run(sequence)
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        guard let nodeA = contact.bodyA.node else { return }
        guard let nodeB = contact.bodyB.node else { return }
        
        let sortedNodes = [nodeA, nodeB].sorted {$0.name ?? "" < $1.name ?? ""}
        
        let firstNode = sortedNodes[0]
        let secondNode = sortedNodes[1]
        
        if secondNode.name == "player" {
            guard isPlayerAlive else { return }
            addExplosion(position: secondNode.position)
            playerShield -= 1
            
            if playerShield == 0 {
                 gameOver()
                secondNode.removeFromParent()
            }
            
            firstNode.removeFromParent()
        } else if let enemy = firstNode as? EnemyNode {
            enemy.shields -= 1
            
            if enemy.shields == 0 {
                addExplosion(position: enemy.position)
                enemy.removeFromParent()
            }
            addExplosion(position: secondNode.position)
            secondNode.removeFromParent()
        } else {
            addExplosion(position:  firstNode.position)
            firstNode.removeFromParent()
            secondNode.removeFromParent()
        }
    }
    
    func gameOver() {
        isPlayerAlive = false
        addExplosion(position: player.position)
        let gameOver = SKSpriteNode(imageNamed: "gameOver")
        addChild(gameOver)
    }
    
    func addExplosion(position: CGPoint) {
        lastAddedExplosion.removeFromParent()
        if let explosion = SKEmitterNode(fileNamed: "Explosion") {
            explosion.name = "explosion"
            explosion.position = position
            addChild(explosion)
            lastAddedExplosion = explosion
        }
    }
}
