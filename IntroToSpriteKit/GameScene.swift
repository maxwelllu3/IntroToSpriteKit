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
        
    }
    
    // Define the animation size and scene
    let frame = CGRect(x: 0, y: 0, width: 800, height: 600)
    var scene = SKScene(size: frame.size)

    // Define, configure, and present the scene
    let view = SKView(frame: frame)
    view.showsNodeCount = true
    view.presentScene(self)
    
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

    // Create and position a boulder sprite near the top left corner of the screen
    let snowball = SKSpriteNode(imageNamed: "snowball")
    snowball.position = CGPoint(x: 100, y: scene.size.height - snowball.size.height / 2)
    self.addChild(snowball)

    // Position six crates in a pyramid
    for i in 1...5 {
        for j in 0...5 - i {
            let snowcube = SKSpriteNode(imageNamed: "snowcube")
            snowcube.name = "one of the snowcubes"              // assign an identifier to this node
            snowcube.position = CGPoint(x: 800 - i * 50 - j * 25, y: 25 + j * 50)
            self.addChild(snowcube)
        }
    }
    
    // Add a physics body for the snow hill
    snowhill.physicsBody = SKPhysicsBody(texture: snowhill.texture!,
                                     alphaThreshold: 0.5,
                                     size: snowhill.size)
    snowhill.physicsBody?.isDynamic = false // snow hill will not move (not impacted by physics)

    // Add a physics body for the boulder
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

    // What is the current mass of a snowcube?
    self.childNode(withName: "one of the snowcubes")?.physicsBody?.mass

    // What is the current mass of the snowball?
    snowball.physicsBody?.mass

    // Change the snowball's mass
    snowball.physicsBody?.mass = 50

    snowball.physicsBody?.restitution = 1

    for node in self.children {

        // Only look at nodes of type SKSpriteNode
        if let thisNode = node as? SKSpriteNode {

            // Only the crates
            if thisNode.name == "one of the snowcubes" {

                // Add a physics body
                thisNode.physicsBody?.restitution = 0.7
            }

        }

    }

    let text = SKSpriteNode(imageNamed: "text")
    text.position = CGPoint(x: 600, y: 450)
    self.addChild(text)

    
    // This runs before each frame is rendered
    // Avoid putting computationally intense code in this function to maintain high performance
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
}
