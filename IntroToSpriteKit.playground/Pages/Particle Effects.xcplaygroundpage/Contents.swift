/*:
 ## Particle Effects
 
 Lorem Ipsum
 
 */

// Required frameworks
import PlaygroundSupport    // Allows playground to show live view
import SpriteKit            // Provides 2D graphics classes

// Define the animation size, scene, and scene color
let frame = CGRect(x: 0, y: 0, width: 400, height: 300)
var scene = SKScene(size: frame.size)

// Define, configure, and present the scene
let view = SKView(frame: frame)
view.showsNodeCount = true
view.presentScene(scene)

// Show the view in the live view area
PlaygroundSupport.PlaygroundPage.current.liveView = view

/*:
 ### Adding Some Flash
 
 Lorem ipsum
 
 */
// Create an instance of the 'SKParticleEmitter' Node
if let sparks = SKEmitterNode(fileNamed: "Sparks") {
    sparks.position = CGPoint(x: scene.size.width / 2, y: scene.size.height / 2)
    scene.addChild(sparks)
}

/*:
 ### Exercises
 
 Lorem ipsum
 
 1. Lorem ipsum
 
 [Previous: Working With Text](@previous) | Page 8 | [Next: Freestyle](@next)
 
 */
