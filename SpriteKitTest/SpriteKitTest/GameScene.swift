//
//  GameScene.swift
//  SpriteKitTest
//
//  Created by Krithick Santhosh on 07/07/23.
//

import SpriteKit
import GameplayKit

// We need to be very precise with the type that SpriteKit wants

enum collisonType: UInt32 {
    case player = 1
    case playerWeapon = 2
    case enemy = 4
    case enemyWeapon = 8
}

class GameScene: SKScene {
    
    let player = SKSpriteNode(imageNamed: "player")
    let waves = Bundle.main.decode([Wave].self, from: "waves.json")
    let enemyTypes = Bundle.main.decode([EnemyType].self, from: "enemy-types.json")
    
    var isPlayerAlive = true
    var levelNumber = 0
    var waveNumber = 0
    
    let positions = Array(stride(from: -160, through: 160, by: 40))
    
    override func didMove(to view: SKView) {
        physicsWorld.gravity = .zero
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
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        for child in children {
            if child.frame.maxX < 0 {
                if !frame.intersects(child.frame) { // if its less than half way and out of screen remove it
                    child.removeFromParent()
                }
            }
            
            let activeEnemies = children.compactMap {$0 as? EnemyNode}
            
            if activeEnemies.isEmpty {
                createWave()
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
}
