//
//  GameButton.swift
//  CrookedCook
//
//  Created by Nicky Thomson on 2018-01-31.
//  Copyright © 2018 Nicky Thomson. All rights reserved.
//

import SpriteKit

class GameButton : SKNode {
    var defaultButton : SKSpriteNode
    var activeButton : SKSpriteNode
    var action : () -> Void
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(defaultButtonImage: String, activeButtonImage: String, buttonAction: @escaping () -> Void) {
        defaultButton = SKSpriteNode(imageNamed: defaultButtonImage)
        activeButton = SKSpriteNode(imageNamed: activeButtonImage)
        activeButton.isHidden = true
        action = buttonAction
        
        super.init()
        
        isUserInteractionEnabled = true
        addChild(defaultButton)
        addChild(activeButton)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        defaultButton.isHidden = true
        activeButton.isHidden = false
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch:UITouch = touches.first!
        let location = touch.location(in: self)
        
        if (defaultButton.contains(location)) {
            defaultButton.isHidden = true
            activeButton.isHidden = false
        } else {
            defaultButton.isHidden = false
            activeButton.isHidden = true
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch:UITouch = touches.first!
        let location = touch.location(in: self)
        
        if (defaultButton.contains(location)) {
            action()
        }
        
        defaultButton.isHidden = false
        activeButton.isHidden = true
    }
    
    // do the same thing as touchesEnded
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.touchesEnded(touches, with: event)
    }
}
