//
//  Wave.swift
//  SpriteKitTest
//
//  Created by Krithick Santhosh on 17/07/23.
//

import SpriteKit

struct Wave: Codable {
    struct WaveEnemy: Codable {
        let position: Int
        let xOffset: CGFloat
        let moveStraight: Bool
    }
    
    let name: String
    let enemies: [WaveEnemy]
}
