//
//  ViewController.swift
//  CrookedCook
//
//  Created by Nicky Thomson on 2018-01-21.
//  Copyright © 2018 Nicky Thomson. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {

    var bucketSprite : SKSpriteNode?
    var gameScene : GameScene?
    
    var spriteArray = NSMutableArray()
    var labelArray = NSMutableArray()
    
    override func loadView() {
        self.view = SKView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        gameScene = GameScene(size: self.view.bounds.size)
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        gameScene?.scaleMode = .resizeFill
        
        let ingredientArray:[String] = ["Lettuce", "Bacon", "BBQ Sauce", "Top Bun", "Bottom Bun", "Top Bun"]
        let rowCount = 2    // max number of ingredients per row
        var i = 0
        let kitchenOrigin = CGPoint(x: (gameScene?.size.width)! * 0.76, y: (gameScene?.size.height)! * 0.25)
        let interval = CGPoint(x: (gameScene?.size.width)! * 0.13, y: (gameScene?.size.height)! * 0.25)
        
        gameScene?.setIngredientsArray(ingredientsArray: ingredientArray as NSArray)
        
        for ingredientName in (ingredientArray as NSArray as! [String]) {
            if let ingredient = IngredientFactory.getIngredient(name: ingredientName) {
                let sprite = ingredient.kitchenSprite
                sprite.setScale(0.6)
                
                let position = CGPoint(x: kitchenOrigin.x + interval.x * (CGFloat)(i % rowCount),
                                       y: kitchenOrigin.y + interval.y * (CGFloat)(i / rowCount))
                
                NSLog("position (%f, %f)", position.x, position.y)
                
                sprite.position = position
                sprite.name = ingredientName
                gameScene?.addChild(sprite)
                
                spriteArray.add(sprite)
                
            }
            
            i = i + 1
        }
        
        gameScene?.backgroundColor = UIColor.blue
        
        skView.presentScene(gameScene)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

