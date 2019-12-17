//
//  GameScene.swift
//  IntroToSpriteKit
//
//  Created by Russell Gordon on 2019-12-07.
//  Copyright © 2019 Russell Gordon. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    // This function runs once to set up the scene
    override func didMove(to view: SKView) {
        
        // Remember to use "self" not "scene"
        
        // Set the background colour
        self.backgroundColor = .black
        
        // Create and position the background image
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: background.size.width / 2, y: background.size.height / 2)
        self.addChild(background)

        // Create and position the snowhill image
        let snowhill = SKSpriteNode(imageNamed: "snowhill")
        snowhill.position = CGPoint(x: snowhill.size.width / 2, y: snowhill.size.height / 2)
        self.addChild(snowhill)

        // Create and position a tree sprite near the left side of the screen
        let tree = SKSpriteNode(imageNamed: "tree")
        tree.position = CGPoint(x: 150, y: 350)
        self.addChild(tree)

        // Create and position a snowball sprite near the top left corner of the screen
        let snowball = SKSpriteNode(imageNamed: "snowball")
        snowball.position = CGPoint(x: 100, y: self.size.height - snowball.size.height / 2)
        self.addChild(snowball)

        // Position six snowcubes in a pyramid
        for i in 1...5 {
            for j in 0...5 - i {
                let snowcube = SKSpriteNode(imageNamed: "snowcube")
                snowcube.name = "one of the snowcubes"              // assign an identifier to this node
                snowcube.position = CGPoint(x: 800 - i * 50 - j * 25, y: 25 + j * 50)
                self.addChild(snowcube)
            }
        }
        
        // Add a physics body for the snowhill
        snowhill.physicsBody = SKPhysicsBody(texture: snowhill.texture!,
                                         alphaThreshold: 0.5,
                                         size: snowhill.size)
        snowhill.physicsBody?.isDynamic = false // snowhill will not move (not impacted by physics)

        // Add a physics body for the snowball
        snowball.physicsBody = SKPhysicsBody(circleOfRadius: snowball.size.width * 0.5)

        // Add a physics body for all nodes with identifier "one of the snowcubes"
        for node in self.children {

            // Only look at nodes of type SKSpriteNode
            if let thisNode = node as? SKSpriteNode {
                // Only the snowcubes
                if thisNode.name == "one of the snowcubes" {
                    // Add a physics body
                    thisNode.physicsBody = SKPhysicsBody(rectangleOf: thisNode.size)
                }
            }
        }

        // Configure the view so that physics body edges are visible
        view.showsPhysics = false

        // Make an edge loop at the boundaries of the scene
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)

        // Change the snowball's physical traits
        snowball.physicsBody?.mass = 50
        snowball.physicsBody?.restitution = 1

        // Change the snowcubes' physical traits
        for node in self.children {
            // Only look at nodes of type SKSpriteNode
            if let thisNode = node as? SKSpriteNode {
                // Only the snowcubes
                if thisNode.name == "one of the snowcubes" {
                    // Add a physics body
                    thisNode.physicsBody?.restitution = 0.7
                }
            }
        }
        
        // Add the Santa Claus into the scene
        let santa = SKSpriteNode(imageNamed: "santa")
        santa.position = CGPoint(x: 950, y: 500)
        self.addChild(santa)
        
        // Add the text saying "Merry Christmas!" into the scene
        let text = SKSpriteNode(imageNamed: "text")
        text.position = CGPoint(x: 1000, y: 450)
        self.addChild(text)
        
        // Add tux the penguin into the scene
        let tux = SKSpriteNode(imageNamed: "tux")
        tux.position = CGPoint(x: 100, y: 100)
        self.addChild(tux)
        
        // Define the actions that causes a node to wait (do nothing)
        let actionOneSecondWait = SKAction.wait(forDuration: 1.0)

        // Define the vectors that describes the movement
        let moveLeftSanta = CGVector(dx: -1100, dy: 0)
        let moveLeftText = CGVector(dx: -400, dy: 0)
        let moveUpTux = CGVector(dx: 0, dy: 50)
        let moveDownTux = CGVector(dx: 0, dy: -50)
        
        // Define the actions that causes athe specified node to move
        let actionLeftSanta = SKAction.move(by: moveLeftSanta, duration: 5)
        let actionLeftText = SKAction.move(by: moveLeftText, duration: 2.5)
        let actionUpTux = SKAction.move(by: moveUpTux, duration: 0.3)
        let actionDownTux = SKAction.move(by: moveDownTux, duration: 0.2)
        
        // Run the action assigned to Santa
        santa.run(actionLeftSanta)
        
        // Run the action assigned to Text
            // Make a sequence of the actions that would assign to Text
        let actionWaitThenMoveLeftText = SKAction.sequence([actionOneSecondWait, actionLeftText])
            // Run the sequence
        text.run(actionWaitThenMoveLeftText)
        
        // Run the action assigned to Tux
            // Make a sequence of the actions that would assign to Tux
        let actionWaitThenMoveUpAndDownTux = SKAction.sequence([actionOneSecondWait, actionUpTux, actionDownTux])
            // Repeat the action assigned to Tux
        let actionTux = SKAction.repeatForever(actionWaitThenMoveUpAndDownTux)
        tux.run(actionTux)
        
        // Remove everything and show end credits
        func removeEverythingThenShowEndCredits() {

            // Remove all existing children nodes
            self.removeAllChildren()

            // Change background to black
            self.backgroundColor = .black

            // Add end credits
            
            // By...
            let by = SKLabelNode(fontNamed: "Luminari")
            by.fontSize = 45
            by.fontColor = .white
            by.text = "Brought to you by Maxwell Lu"
            by.zPosition = 3
            by.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2 + 50)
            self.addChild(by)

            // And...
            let and = SKLabelNode(fontNamed: "Luminari")
            and.fontSize = 36
            and.fontColor = .white
            and.text = "and the Grade 12 AP Computer Science class"
            and.zPosition = 3
            and.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2 - 50)
            self.addChild(and)

        }
        
        let actionSixSecondWait = SKAction.wait(forDuration: 6)
        // Set sequence to wait then remove all nodes and show end credits
               let actionShowEndCredits = SKAction.run(removeEverythingThenShowEndCredits)
               let actionWaitThenShowEndCredits = SKAction.sequence([actionSixSecondWait, actionOneSecondWait, actionOneSecondWait, actionOneSecondWait, actionOneSecondWait, actionOneSecondWait, actionShowEndCredits])
               self.run(actionWaitThenShowEndCredits)
        
    }
    
    
    // This runs before each frame is rendered
    // Avoid putting computationally intense code in this function to maintain high performance
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
}
