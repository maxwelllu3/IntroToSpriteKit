/*:
 ## Positioning Sprites
 
 Immediately below is the code we first explored on the prior page.
 
 Read past this section of code to learn how to create and position sprites.
 */

// Required frameworks
import PlaygroundSupport    // Allows playground to show live view
import SpriteKit            // Provides 2D graphics classes

// Define the animation size and scene
let frame = CGRect(x: 0, y: 0, width: 400, height: 320)
var scene = SKScene(size: frame.size)

// Define, configure, and present the scene
let view = SKView(frame: frame)
view.showsNodeCount = true
view.presentScene(scene)

// Show the view in the live view area
PlaygroundSupport.PlaygroundPage.current.liveView = view

/*:
 ### What is a sprite?
 
 Sprites can take the the form of abstract shapes – for example, via an instance of `SKShapeNode`.
 
 More commonly, sprites are created from the `SKSpriteNode` class and based on a bitmap image you provide.
 
 This means sprites in your games or animations can be images you find online, or images you create yourself (for example, using an iPad, or by scanning hand-drawn images).
 
 - Callout(Explore):
 Click the disclosure triangle for this playground page. Do the same for the **Resources** subfolder. What do you see?
 
 ![disclosure](disclosure.png)
 
 Let's create a few sprites using images from the **Resources** folder.
 */

// Create and position a sprite at the origin, using the "circle.png" image
let circle = SKSpriteNode(imageNamed: "circle")
circle.position = CGPoint(x: 0, y: 0)

/*:
 - Experiment:
 Run the playground now. What do you notice? What is the node count?
 
 It's not enough to simply create an instance of the `SKSpriteNode` class. For the sprite to appear, it must be added to the scene.
 
 - Experiment:
    Uncomment the line of code below.
    
    Observe the change to the node count.
 
    What does the position of the sprite tell you about the location of the origin in a SpriteKit scene?
 
 */

//scene.addChild(circle)
 
/*:
 [Previous: Creating a SpriteKit Scene](@previous) | Page 3 | [Next: ???](@next)
 
 
 */
