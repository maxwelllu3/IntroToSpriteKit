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
    
    // Tree green
    let treeGreen = NSColor(calibratedRed: 42/255, green: 185/255, blue: 79/255, alpha: 1)
    
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
        
        // Place a tree in the foreground at right, and give it an edge loop body (for the "Holidays" letters to hit)
        let tree = SKSpriteNode(imageNamed: "Tree_2")
        tree.position = CGPoint(x: self.size.width - 50, y: tree.size.height - 16)
        tree.zPosition = 5
        let treePhysicsBodyLocation = CGRect(x: -1 * tree.size.width / 2, y: -1 * tree.size.height / 2, width: 1, height: tree.size.height) // relative to sprite's position
        tree.physicsBody = SKPhysicsBody(edgeLoopFrom: treePhysicsBodyLocation)
        self.addChild(tree)
        
        // Add a reindeer
        let reindeer = SKSpriteNode(imageNamed: "deer_01")
        reindeer.position = CGPoint(x: -50, y: 128 + reindeer.size.height / 2)
        reindeer.zPosition = 4
        self.addChild(reindeer)
        
        // Create an empty array of SKTexture objects
        var reindeerRunningTextures: [SKTexture] = []
        
        // Now add the two images we need in the array
        reindeerRunningTextures.append(SKTexture(imageNamed: "deer_01"))
        reindeerRunningTextures.append(SKTexture(imageNamed: "deer_02"))
        reindeerRunningTextures.append(SKTexture(imageNamed: "deer_03"))
        
        // Create action of reindeer running
        let actionRunningAnimation = SKAction.animate(with: reindeerRunningTextures, timePerFrame: 0.2, resize: true, restore: true)

        // Create an action that moves reindeer right by 10 pixels
        let actionMoveRight = SKAction.moveBy(x: 20, y: 0, duration: 0.2)
        
        // Repeat the move forward action 3 times
        let actionMoveRightThrice = SKAction.repeat(actionMoveRight, count: 3)
        
        // Combine running animation and moving right
        let actionMoveAndRun = SKAction.group([actionRunningAnimation, actionMoveRightThrice])
        
        // Repeat this five times
        let actionMoveAndRunManyTimes = SKAction.repeat(actionMoveAndRun, count: 15)
        
        // Run the action on the reindeer
        reindeer.run(actionMoveAndRunManyTimes)

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
        let horizontalShelf = SKSpriteNode(imageNamed: "horizontal-shelf")
        horizontalShelf.position = CGPoint(x: horizontalShelf.size.width / 2, y: self.size.height / 2)
        let shelfPhysicsBodyLocation = CGRect(x: -400, y: 100, width: 800, height: 1) // relative to sprite's position
        horizontalShelf.physicsBody = SKPhysicsBody(edgeLoopFrom: shelfPhysicsBodyLocation)
        self.addChild(horizontalShelf)
        
        // Set up actions needed for delayed "Happy"
        let actionShortWait = SKAction.wait(forDuration: 0.5)
        let actionOneSecondWait = SKAction.wait(forDuration: 1)
        let actionSixSecondWait = SKAction.wait(forDuration: 6)
        let actionAddH = SKAction.run {
            self.add(letter: "H", at: 200)
        }
        let actionAddA = SKAction.run {
            self.add(letter: "a", at: 250)
        }
        let actionAddP = SKAction.run {
            self.add(letter: "p", at: 300)
        }
        let actionAddP2 = SKAction.run {
            self.add(letter: "p", at: 350)
        }
        let actionAddY = SKAction.run {
            self.add(letter: "y", at: 400)
        }
        let actionHappyNotAffectedByGravity = SKAction.run(makeHappyNotAffectedByGravity)
        let actionGravityPullToRight = SKAction.run(gravityPullToRight)
        let actionAddBangFromLeft = SKAction.run {
            self.addFromLeft(letter: "!", color: .red, withPhysicsBodyWidth: 18)
        }
        let actionAddSFromLeft = SKAction.run {
            self.addFromLeft(letter: "s", color: self.treeGreen, withPhysicsBodyWidth: 35)
        }
        let actionAddYFromLeft = SKAction.run {
            self.addFromLeft(letter: "y", color: .red, withPhysicsBodyWidth: 40)
        }
        let actionAddAFromLeft = SKAction.run {
            self.addFromLeft(letter: "a", color: self.treeGreen, withPhysicsBodyWidth: 40)
        }
        let actionAddDFromLeft = SKAction.run {
            self.addFromLeft(letter: "d", color: .red, withPhysicsBodyWidth: 45)
        }
        let actionAddIFromLeft = SKAction.run {
            self.addFromLeft(letter: "i", color: self.treeGreen, withPhysicsBodyWidth: 20)
        }
        let actionAddLFromLeft = SKAction.run {
            self.addFromLeft(letter: "l", color: .red, withPhysicsBodyWidth: 20)
        }
        let actionAddOFromLeft = SKAction.run {
            self.addFromLeft(letter: "o", color: self.treeGreen, withPhysicsBodyWidth: 45)
        }
        let actionAddHFromLeft = SKAction.run {
            self.addFromLeft(letter: "H", color: .red, withPhysicsBodyWidth: 80)
        }

        // Immediately add the "H"
        self.run(actionAddH)
        
        // Wait a second then add the "a"
        let actionWaitThenAddA = SKAction.sequence([actionOneSecondWait, actionAddA])
        self.run(actionWaitThenAddA)

        // Wait two seconds then add the "p"
        let actionWaitThenAddP = SKAction.sequence([actionOneSecondWait, actionOneSecondWait, actionAddP])
        self.run(actionWaitThenAddP)

        // Wait three seconds then add the second "p"
        let actionWaitThenAddP2 = SKAction.sequence([actionOneSecondWait, actionOneSecondWait,  actionOneSecondWait, actionAddP2])
        self.run(actionWaitThenAddP2)

        // Wait four seconds then add the "y", then wait two more seconds, then make "Happy" letters not be affected by gravity, then make gravity pull to the right
        let actionWaitThenAddY = SKAction.sequence([actionOneSecondWait, actionOneSecondWait, actionOneSecondWait, actionOneSecondWait, actionAddY, actionOneSecondWait, actionOneSecondWait, actionHappyNotAffectedByGravity, actionGravityPullToRight])
        self.run(actionWaitThenAddY)
        
        // Wait six seconds then start adding the letters from "Holidays!" at 0.5 second intervals
        let actionWaitThenAddBangFromLeft = SKAction.sequence([actionSixSecondWait, actionAddBangFromLeft])
        self.run(actionWaitThenAddBangFromLeft)
        
        // Add the s
        let actionWaitThenAddSFromLeft = SKAction.sequence([actionSixSecondWait, actionShortWait, actionAddSFromLeft])
        self.run(actionWaitThenAddSFromLeft)

        // Add the y
        let actionWaitThenAddYFromLeft = SKAction.sequence([actionSixSecondWait, actionShortWait, actionShortWait, actionAddYFromLeft])
        self.run(actionWaitThenAddYFromLeft)

        // Add the a
        let actionWaitThenAddAFromLeft = SKAction.sequence([actionSixSecondWait, actionShortWait, actionShortWait, actionShortWait, actionAddAFromLeft])
        self.run(actionWaitThenAddAFromLeft)

        // Add the d
        let actionWaitThenAddDFromLeft = SKAction.sequence([actionSixSecondWait, actionShortWait, actionShortWait, actionShortWait, actionShortWait, actionAddDFromLeft])
        self.run(actionWaitThenAddDFromLeft)

        // Add the i
        let actionWaitThenAddIFromLeft = SKAction.sequence([actionSixSecondWait, actionShortWait, actionShortWait, actionShortWait, actionShortWait, actionShortWait, actionAddIFromLeft])
        self.run(actionWaitThenAddIFromLeft)

        // Add the l
        let actionWaitThenAddLFromLeft = SKAction.sequence([actionSixSecondWait, actionShortWait, actionShortWait, actionShortWait, actionShortWait, actionShortWait, actionShortWait, actionAddLFromLeft])
        self.run(actionWaitThenAddLFromLeft)

        // Add the o
        let actionWaitThenAddOFromLeft = SKAction.sequence([actionSixSecondWait, actionShortWait, actionShortWait, actionShortWait, actionShortWait, actionShortWait, actionShortWait, actionShortWait, actionAddOFromLeft])
        self.run(actionWaitThenAddOFromLeft)

        // Add the H
        let actionWaitThenAddHFromLeft = SKAction.sequence([actionSixSecondWait, actionShortWait, actionShortWait, actionShortWait, actionShortWait, actionShortWait, actionShortWait, actionShortWait, actionShortWait, actionAddHFromLeft])
        self.run(actionWaitThenAddHFromLeft)


    }
    
    // Add a letter from the first word, "Happy"
    func add(letter: String, at x: CGFloat) {
        let newLetter = SKLabelNode(fontNamed: "SignPainter")
        newLetter.fontSize = 144
        newLetter.fontColor = .white
        newLetter.text = letter
        newLetter.name = "happy letters"
        newLetter.zPosition = 5
        newLetter.position = CGPoint(x: x, y: self.size.height + 100)
        newLetter.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 40, height: 90),
                                           center: CGPoint(x: 0, y: 35))
        newLetter.physicsBody?.restitution = 0.3
        self.addChild(newLetter)

    }

    // Add a letter from the second word, "Holidays"
    func addFromLeft(letter: String, color: NSColor, withPhysicsBodyWidth width: CGFloat) {
        let newLetter = SKLabelNode(fontNamed: "Big Caslon Medium")
        newLetter.fontSize = 120
        newLetter.fontColor = color
        newLetter.text = letter
        newLetter.name = "holidays letters"
        newLetter.zPosition = 6
        newLetter.position = CGPoint(x: -100, y: self.size.height / 2 - 15)
        newLetter.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: width, height: 90),
                                           center: CGPoint(x: 0, y: 35))
        newLetter.physicsBody?.restitution = 0.2
        self.addChild(newLetter)

    }

    
    // Make gravity cause items to fall from the left (gravity pulls to right side of screen)
    func gravityPullToRight() {
        let pullToRight = CGVector(dx: 9.8, dy: 0)
        self.physicsWorld.gravity = pullToRight
    }
    
    // Make the letters in the word "Happy" not be affected by gravity
    func makeHappyNotAffectedByGravity() {
        
        // Loop through all child nodes of the scene
        for node in self.children {
            
            // Only look at nodes of type SKLabelNode
            if let thisNode = node as? SKLabelNode {

                // Only the letters from the word happy
                if thisNode.name == "happy letters" {

                    // Make the physics body not be affected by gravity any more
                    thisNode.physicsBody?.affectedByGravity = false
                }

            }
        }
    }
    
    // This runs before each frame is rendered
    // Avoid putting computationally intense code in this function to maintain high performance
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
}
