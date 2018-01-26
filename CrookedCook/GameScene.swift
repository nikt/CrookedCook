//
//  GameScene.swift
//  CrookedCook
//
//  Created by Nicky Thomson on 2018-01-26.
//  Copyright © 2018 Nicky Thomson. All rights reserved.
//

import SpriteKit

class GameScene : SKScene {
    var ingredientsArray : NSArray?
    
    public func setIngredientsArray(ingredientsArray : NSArray) {
        self.ingredientsArray = ingredientsArray;
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch:UITouch = touches.first!
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        
        if let name = touchedNode.name {
            if (ingredientsArray?.contains(name))! {
                print("touched: \(name)")
            }
        }
    }
}
