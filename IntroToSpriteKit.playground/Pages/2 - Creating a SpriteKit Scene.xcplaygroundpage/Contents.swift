/*:
 ## Creating a SpriteKit Scene
 
 Everything that appears on screen in a SpriteKit-based app is a *node*.
 
 The *scene* is the *parent node*.
 
 Let's create and present a scene now.
 
 ### Required Frameworks
 
 First we must import some required frameworks.
 */
import PlaygroundSupport    // Allows playground to show live view
import SpriteKit            // Provides 2D graphics classes

/*:
 ### Create the scene
 */
// Define a frame with the desired size (an instance of the CGRect class)
let frame = CGRect(x: 0, y: 0, width: 400, height: 320)

// Define a scene to contain our game or animation (an instance of the SKScene class)
var scene = SKScene(size: frame.size)

/*:
 ### Present the scene
 In projects built upon the UIKit framework, you have previously used Interface Builder to add views to a storyboard.
 
 Here, we create a view using code instead, and then show that view in the playground's live view area.
 */

// Define a view (an instance of SKView)
let view = SKView(frame: frame)

// Ask the view to show how many nodes exist in the scene
view.showsNodeCount = true

// Present the scene we just configured
view.presentScene(scene)

// Show the view in the live view area
PlaygroundSupport.PlaygroundPage.current.liveView = view

/*:
 ### Node count
 
 Run the playground.
 
 Notice that the node count is 1. That node is the scene itself.
 
[Previous: UIKit vs. SpriteKit](@previous) | Page 2 | [Next: Positioning Sprites](@next)
*/
