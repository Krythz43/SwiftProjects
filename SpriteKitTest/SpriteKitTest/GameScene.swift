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
    
    override func didMove(to view: SKView) {
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
}
