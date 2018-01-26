//
//  IngredientFactory.swift
//  CrookedCook
//
//  Created by Nicky Thomson on 2018-01-22.
//  Copyright © 2018 Nicky Thomson. All rights reserved.
//

import SpriteKit

class IngredientFactory {
    // singleton
    static let sharedInstance = IngredientFactory()
    
    var ingredientDictionary : NSDictionary?
    
    init() {
        // load dictionary from plist
        if let path = Bundle.main.path(forResource: "Ingredients", ofType: "plist") {
            ingredientDictionary = NSDictionary(contentsOfFile: path)
        }
    }
    
    // static method to create ingredients from loaded dictionary
    static func getIngredient(name: String) -> Ingredient? {
        
        if let dictionary = sharedInstance.ingredientDictionary?[name] as? [String:AnyObject] {
            let ingredient = Ingredient(withName: name)
            
            ingredient.name = name
            ingredient.price = dictionary["price"] as? Double
            
            // set up kitchen sprite
            ingredient.setKitchenSpriteTexture(imageName: "bucket")
            
            // set up recipe sprite
            ingredient.setRecipeSpriteTexture(imageName: "bucket")
            
            if let colorComponents = dictionary["color"] as? NSArray {
                ingredient.color = UIColor(
                    red:    (colorComponents[0] as! CGFloat) / 255.0,
                    green:  (colorComponents[1] as! CGFloat) / 255.0,
                    blue:   (colorComponents[2] as! CGFloat) / 255.0,
                    alpha:  1.0
                )
                
                ingredient.kitchenSprite.color = ingredient.color!
                ingredient.recipeSprite.color = ingredient.color!
            }
            
            return ingredient;
        }
        
        return nil
    }
}
