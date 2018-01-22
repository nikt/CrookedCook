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
            let ingredient = Ingredient()
            
            ingredient.name = name
            ingredient.price = dictionary["price"] as? Double
            
            if let colorComponents = dictionary["color"] as? NSArray {
                ingredient.color = UIColor(
                    red: colorComponents[0] as! CGFloat,
                    green: colorComponents[1] as! CGFloat,
                    blue: colorComponents[2] as! CGFloat,
                    alpha: 1.0
                )
            }
            
            return ingredient;
        }
        
        return nil
    }
}
