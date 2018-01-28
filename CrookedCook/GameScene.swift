//
//  GameScene.swift
//  CrookedCook
//
//  Created by Nicky Thomson on 2018-01-26.
//  Copyright © 2018 Nicky Thomson. All rights reserved.
//

import SpriteKit

class GameScene : SKScene {
    var ingredientsArray : NSMutableArray?
    
    var selectedIngredient : Ingredient?
    var draggedSprite : SKSpriteNode?
    
    public func setIngredientsArray(namesArray : NSArray) {
        // reset array
        if let array = self.ingredientsArray {
            array.removeAllObjects();
        } else {
            self.ingredientsArray = NSMutableArray();
        }
        
        let rowCount = 2    // max number of ingredients per row
        var i = 0
        let kitchenOrigin = CGPoint(x: self.size.width * 0.76, y: self.size.height * 0.25)
        let interval = CGPoint(x: self.size.width * 0.13, y: self.size.height * 0.25)
        
        for ingredientName in (namesArray as! [String]) {
            if let ingredient = IngredientFactory.getIngredient(name: ingredientName) {
                let sprite = ingredient.kitchenSprite
                sprite.setScale(0.6)
                
                let position = CGPoint(x: kitchenOrigin.x + interval.x * (CGFloat)(i % rowCount),
                                       y: kitchenOrigin.y + interval.y * (CGFloat)(i / rowCount))
                
                NSLog("position (%f, %f)", position.x, position.y)
                
                sprite.position = position
                sprite.name = ingredientName
                self.addChild(sprite)
                
                if let array = ingredientsArray {
                    array.add(ingredient)
                }
                
            }
            
            i = i + 1
        }
        
        self.backgroundColor = UIColor.blue
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch:UITouch = touches.first!
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        
        for ingredient in (ingredientsArray as! [Ingredient]) {
//            print("checked: \(ingredient.name!) vs \(touchedNode.name!)")
            if (ingredient.name == touchedNode.name) {
                print("touched: \(ingredient.name!)")
                
                // make a copy of the kitchen sprite to use as the dragging sprite
                if let sprite = ingredient.kitchenSprite.copy() as? SKSpriteNode {
                    sprite.alpha = 0.75
                    self.addChild(sprite)
                    self.draggedSprite = sprite
                }
                break
            }
        }
    }
    
    // move draggedSprite around with the touch
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let sprite = self.draggedSprite {
            let touch:UITouch = touches.first!
            let positionInScene = touch.location(in: self)
            sprite.position = positionInScene
        }
    }
    
    // determine if anything needs to be done if the user is dragging any ingredient
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // remove draggedSprite when the touch ends
        if let sprite = self.draggedSprite {
            sprite.removeFromParent()
            self.draggedSprite = nil
        }
    }
    
    // do the same thing as touchesEnded
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.touchesEnded(touches, with: event)
    }
}
