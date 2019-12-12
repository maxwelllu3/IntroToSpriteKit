//
//  GameScene.swift
//  IntroToSpriteKit
//
//  Created by Russell Gordon on 2019-12-07.
//  Copyright © 2019 Russell Gordon. All rights reserved.
//

import SpriteKit
import GameplayKit
import AVFoundation

class GameScene: SKScene {
    
    // Background music player
    var backgroundMusic: AVAudioPlayer?
    
    // This function runs once to set up the scene
    override func didMove(to view: SKView) {
        
        // Set the background colour
        self.backgroundColor = .black
        
//        // Get a reference to the mp3 file in the app bundle
//        let backgroundMusicFilePath = Bundle.main.path(forResource: "sleigh-bells-excerpt.mp3", ofType: nil)!
//
//        // Convert the file path string to a URL (Uniform Resource Locator)
//        let backgroundMusicFileURL = URL(fileURLWithPath: backgroundMusicFilePath)
//
//        // Attempt to open and play the file at the given URL
//        do {
//            backgroundMusic = try AVAudioPlayer(contentsOf: backgroundMusicFileURL)
//            backgroundMusic?.play()
//        } catch {
//            // Do nothing if the sound file could not be played
//        }
        
        
        // Blue background
        self.backgroundColor = NSColor(calibratedHue: 240/360, saturation: 80/100, brightness: 20/100, alpha: 1)
        
        // Place a tree in the foreground at right
        let tree = SKSpriteNode(imageNamed: "Tree_2")
        tree.position = CGPoint(x: self.size.width - 50, y: tree.size.height - 16)
        tree.zPosition = 5
        self.addChild(tree)
        
        // Add a middle background to create perspective effect
        let middleBackground = SKSpriteNode(imageNamed: "perspective")
        middleBackground.position = CGPoint(x: middleBackground.size.width / 2, y: 178)
        middleBackground.zPosition = 0
        self.addChild(middleBackground)
        
        // Create the ground
        for x in 0...6 {
            let groundTile = SKSpriteNode(imageNamed: "middle-ground")
            groundTile.position = CGPoint(x: groundTile.size.width / 2 + CGFloat(x) * groundTile.size.width , y: groundTile.size.height / 2)
            groundTile.zPosition = 2 // Ahead of the white rectangle
            self.addChild(groundTile)
        }
        
        // Set up snow in the background
        if let snowstorm = SKEmitterNode(fileNamed: "Snow") {

            // Position the node and add to scene – write the code to make this happen
            snowstorm.position = CGPoint(x: self.size.width / 2, y: self.size.height)
            self.addChild(snowstorm)
            
        }
        
        // Add an edge loop body in the middle of the scene
        let horizontalShelf = SKSpriteNode(imageNamed: "horizontal-shelf-red")
        horizontalShelf.position = CGPoint(x: horizontalShelf.size.width / 2, y: self.size.height / 2)
        horizontalShelf.physicsBody = SKPhysicsBody(edgeLoopFrom: CGRect(x: -400, y: 50, width: 800, height: 1))
        self.addChild(horizontalShelf)
        
        // Add an H
        let h = SKLabelNode(fontNamed: "SignPainter")
        h.fontSize = 144
        h.fontColor = .white
        h.text = "H"
        h.position = CGPoint(x: 200, y: self.size.height - 50)
        h.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 40, height: 90),
                                           center: CGPoint(x: 0, y: 35))
        h.physicsBody?.restitution = 0.3
        self.addChild(h)

        // Add an a
        let a = SKLabelNode(fontNamed: "SignPainter")
        a.fontSize = 144
        a.fontColor = .white
        a.text = "a"
        a.position = CGPoint(x: 250, y: self.size.height - 50)
        a.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 40, height: 90),
                                           center: CGPoint(x: 0, y: 35))
        a.physicsBody?.restitution = 0.3
        self.addChild(a)

        // Add a p
        let p = SKLabelNode(fontNamed: "SignPainter")
        p.fontSize = 144
        p.fontColor = .white
        p.text = "p"
        p.position = CGPoint(x: 300, y: self.size.height - 50)
        p.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 40, height: 90),
                                           center: CGPoint(x: 0, y: 35))
        p.physicsBody?.restitution = 0.3
        self.addChild(p)

        // Add another p
        let p2 = SKLabelNode(fontNamed: "SignPainter")
        p2.fontSize = 144
        p2.fontColor = .white
        p2.text = "p"
        p2.position = CGPoint(x: 350, y: self.size.height - 50)
        p2.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 40, height: 90),
                                           center: CGPoint(x: 0, y: 35))
        p2.physicsBody?.restitution = 0.3
        self.addChild(p2)

        // Add a y
        let y = SKLabelNode(fontNamed: "SignPainter")
        y.fontSize = 144
        y.fontColor = .white
        y.text = "y"
        y.position = CGPoint(x: 400, y: self.size.height - 50)
        y.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 40, height: 90),
                                           center: CGPoint(x: 0, y: 35))
        y.physicsBody?.restitution = 0.3
        self.addChild(y)


    }
    
    // This runs before each frame is rendered
    // Avoid putting computationally intense code in this function to maintain high performance
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
}
