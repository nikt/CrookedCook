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
    var gameScene : SKScene?
    
    override func loadView() {
        self.view = SKView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        gameScene = SKScene(size: self.view.bounds.size)
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        gameScene?.scaleMode = .resizeFill
        
        let ingredientArray:[String] = ["Lettuce", "Bacon", "BBQ Sauce", "Bun"]
        //        let rowCount = 2    // max number of ingredients per row
        var i = 0
        let interval = (gameScene?.size.width)! / 5.0
        
        for ingredientName in (ingredientArray as NSArray as! [String]) {
            if let ingredient = IngredientFactory.getIngredient(name: ingredientName) {
                let sprite = ingredient.kitchenSprite
                
                let position = CGPoint(x: interval * (CGFloat)(i + 1), y: (gameScene?.size.height)! / 2.0)
                
                NSLog("position (%f, %f)", position.x, position.y)
                
                sprite?.position = position
                gameScene?.addChild(sprite!)
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

