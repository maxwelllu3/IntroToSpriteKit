//
//  ViewController.swift
//  IntroToSpriteKit
//
//  Created by Russell Gordon on 2019-12-07.
//  Copyright © 2019 Russell Gordon. All rights reserved.
//

import Cocoa
import SpriteKit
import GameplayKit

class ViewController: NSViewController {

    @IBOutlet var skView: SKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Change size of view
        self.skView.frame = NSRect(x: 0, y: 0, width: 1200, height: 900)
        
        // Create a scene based on the GameScene class
        // Size is the same as the size set in the storyboard for this view
        let scene = GameScene(size: skView.frame.size)
        
        // Show frames per second in the view
        self.skView.showsFPS = true
        
        // Keep track of how many nodes (visual elements) are on screen
        // (The fewer nodes the better for performance reasons)
        self.skView.showsNodeCount = true
        
        // Present the scene (which is an instance of the GameScene class)
        skView.presentScene(scene)

    }
}

