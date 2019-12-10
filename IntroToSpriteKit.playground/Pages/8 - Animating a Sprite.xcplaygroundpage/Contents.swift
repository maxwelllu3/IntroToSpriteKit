/*:
 ## Animating a Sprite
 
 The code below sets up a basic scene with a black background.
 
 Read past this code section to learn how to animate a sprite to create the appearance of realistic movement.
 
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
 ### Animation
 
 TODO: Make an example of mario walking in a scene. See https://youtu.be/lXTTgBQuw8M?t=472 for details. Get images from one of last year's examples with Greenfoot.
 
 */


/*:
 ### Exercises
 
 1. TODO: Find images that the student can use to make a bird fly (flap it's wings) as it moves across the screen in the opposite direction.
 
 [Previous: Working With Text](@previous) | Page 8 | [Next: Particle Effects](@next)
 
 */
