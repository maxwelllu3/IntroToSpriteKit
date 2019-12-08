/*:
 ## Physics Engine
 
 Immediately below is code similar to what we explored on a prior page.
 
 Read past this section of code to learn how SpriteKit makes it possible for sprites (nodes) to interact in a realistic fashion.
 */

// Required frameworks
import PlaygroundSupport    // Allows playground to show live view
import SpriteKit            // Provides 2D graphics classes

// Define the animation size and scene
let frame = CGRect(x: 0, y: 0, width: 525, height: 320)
var scene = SKScene(size: frame.size)

// Define, configure, and present the scene
let view = SKView(frame: frame)
view.showsNodeCount = true
view.presentScene(scene)

// Show the view in the live view area
PlaygroundSupport.PlaygroundPage.current.liveView = view

/*:
 ### Setting the scene
 
 In the code below, a node that contains a cliff and a bit of a ramp are positioned at the bottom left corner of the scene.
 
 A boulder is positioned near the top left corner of the screen.
 
 Some crates are stacked at the bottom of the hill.
 
 And yes, all of these graphics are hand-drawn by Mr. Gordon – the artist who brought you the camelCase camel:
 
 ![camelCase](camelCase.jpeg)
 
 Run the code to see this scene.
 
 - Callout(Consider):
     What if we could have the boulder roll down the hill?
 
 */

// Create and position a boulder sprite near the top left corner of the screen
let boulder = SKSpriteNode(imageNamed: "boulder")
boulder.position = CGPoint(x: 50, y: scene.size.height - 25)
scene.addChild(boulder)

// Create and position the hill
let hill = SKSpriteNode(imageNamed: "hill")
hill.anchorPoint = CGPoint(x: 0, y: 0)      // Position sprite via it's bottom left corner, instead of                                            // it's centre point
hill.position = CGPoint(x: 0, y: 0)
scene.addChild(hill)

// Position six crates in a pyramid
for i in 1...3 {
    for j in 0...3 - i {
        let crate = SKSpriteNode(imageNamed: "crate")
        crate.name = "one of the crates"              // assign an identifier to this node
        crate.position = CGPoint(x: 500 - i * 50 - j * 25, y: 25 + j * 50)
        scene.addChild(crate)
    }
}

/*:
 ### Configuring Physics Bodies
 
 To allow nodes to interact with one another, we must define *bodies*, or edges, for the nodes.
 
 - Callout(Experiment):
 Remove the comments for each block of code below, one by one. Run the scene after each comment you remove. What happens?

 Remember that you can select a block of code by positioning your cursor at the left edge of the first line, then hold down the **Shift** key, then press the **↓** key.
  
 Once you have selected the block of code, press the **Command** and / keys at the same time to toggle the comments off all at once.
 
 */
//// Add a physics body for the hill
//hill.physicsBody = SKPhysicsBody(texture: hill.texture!,
//                                 alphaThreshold: 0.2,
//                                 size: hill.size)

//// Add a physics body for the boulder
//boulder.physicsBody = SKPhysicsBody(texture: boulder.texture!,
//                                    alphaThreshold: 0.2,
//                                    size: boulder.size)

//// Add a physics body for all nodes with identifier "one of the crates"
//for node in scene.children {
//
//    // Only look at nodes of type SKSpriteNode
//    if let thisNode = node as? SKSpriteNode {
//
//        // Only the crates
//        if thisNode.name == "one of the crates" {
//
//            // Add a physics body
//            thisNode.physicsBody = SKPhysicsBody(texture: thisNode.texture!,
//                                                 alphaThreshold: 0.2,
//                                                 size: thisNode.size)
//
//        }
//
//    }
//
//}

/*:
 - Callout(Reflect):
     What type of animations could you imagine creating using the SpriteKit Physics engine? What types of games?
 
 ### Exercises
 
 Write code to complete each of the following tasks.
 
 1. lorem ipsum
 2. lorem ipsum
 3. lorem ipsum
 
 */

// Exercise 1: Write your code below.


// Exercise 2: Write your code below.


// Exercise 3: Write your code below.



/*:

 [Previous: Creating a SpriteKit Scene](@previous) | Page 3 | [Next: Physics Engine](@next)
 
 
 */
