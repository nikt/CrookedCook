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
    var recipeSprite : SKSpriteNode?
    
    // sprite used when the ingredient is available in the kitchen
    var kitchenSprite : SKSpriteNode?
    
    // empty init
    init() {
        // do nothing
    }
    
    // initialize Ingredient from a name, look up values from dictionaru
    init(withName name: String) {
        self.name = name;
    }
}
