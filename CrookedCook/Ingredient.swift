//
//  Ingredient.swift
//  CrookedCook
//
//  Created by Nicky Thomson on 2018-01-22.
//  Copyright © 2018 Nicky Thomson. All rights reserved.
//

import SpriteKit

class Ingredient {
    // ingredient name, used for display
    var name : String?
    
    // color value
    var color : UIColor?
    
    // price value
    var price : Double?
    
    // sprite used when the ingredient is in a recipe
    var recipeSprite : SKSpriteNode
    
    // sprite used when the ingredient is available in the kitchen
    var kitchenSprite : SKSpriteNode
    
    // empty init
    init() {
        // set up sprites
        recipeSprite = SKSpriteNode()
        recipeSprite.colorBlendFactor = 1.0
        
        kitchenSprite = SKSpriteNode()
        kitchenSprite.colorBlendFactor = 1.0
    }
    
    // initialize Ingredient from a name, look up values from dictionaru
    convenience init(withName name: String) {
        self.init()
        
        self.name = name;
    }
    
    public func setKitchenSpriteTexture(imageName: String) {
        // load new texture
        kitchenSprite.texture = SKTexture(imageNamed: imageName)
        
        // set proper size
        kitchenSprite.size = (kitchenSprite.texture?.size())!
    }
    
    public func setRecipeSpriteTexture(imageName: String) {
        // load new texture
        recipeSprite.texture = SKTexture(imageNamed: imageName)
        
        // set proper size
        recipeSprite.size = (kitchenSprite.texture?.size())!
    }
}
