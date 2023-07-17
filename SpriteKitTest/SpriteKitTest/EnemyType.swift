//
//  EnemyType.swift
//  SpriteKitTest
//
//  Created by Krithick Santhosh on 17/07/23.
//

import SpriteKit

struct EnemyType: Codable {
    let name: String
    let shields: Int
    let speed: CGFloat
    let powerUpChance: Int
}
