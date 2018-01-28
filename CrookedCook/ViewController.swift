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
        gameScene?.setIngredientsArray(namesArray: ingredientArray as NSArray)
        
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

