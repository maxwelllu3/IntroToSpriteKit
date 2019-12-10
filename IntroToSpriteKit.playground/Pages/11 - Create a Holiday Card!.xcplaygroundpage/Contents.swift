/*:
 ## Create a Holiday Card!
 
 Here's an example of a seasonal animation that I created using SpriteKit:
 
 TODO - ADD EMBEDDED VIDEO
 
 Now it's your turn – go ahead and create something of your own design!
 
 Aim to include as many SpriteKit concepts as possible that you've learned about by completing this playground.
 
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

 [Previous: Freestyle](@previous) | Page 11
 
 */

