//
//  TestSpriteKitClass.swift
//  SpriteKitTest
//
//  Created by Krithick Santhosh on 08/07/23.
//

import Foundation
import SpriteKit

class testSpriteKitClass: SKScene {
    override func touchesEstimatedPropertiesUpdated(_ touches: Set<UITouch>) {
        // Some code for estimated touches
    }
    
    override func didEvaluateActions() {
        // after actions are evaluated do something
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        camera?.scene
        // camera object
    }
}
