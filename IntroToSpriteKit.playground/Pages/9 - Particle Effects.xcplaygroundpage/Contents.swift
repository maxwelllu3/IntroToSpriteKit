/*:
 ## Particle Effects
 
 The scene below sets up a basic scene with a blue background and a "ground" sprite.
 
 Read past this code to learn how particle effects can be used to add some extra sizzle to your SpriteKit animations.
 
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
 ### An "Attack" Animation
 
 - Experiment:
    Uncomment the block of code below, then run the playground.
 
    You should see a character (from an old video game) repeatedly making a motion.
 
 Doesn't it look like the character should be throwing a fireball? Let's make that happen.
 
 */


/*:
 ### It's Getting Hot in Here
 
 - Experiment:
    Uncomment the blocks of code below, one block at a time. Run the playground after uncommenting each block.
 
    What happens?
 
 */

// Create an instance of the 'SKParticleEmitter' Node
if let sparks = SKEmitterNode(fileNamed: "Sparks") {
    sparks.position = CGPoint(x: scene.size.width / 2, y: scene.size.height / 2)
    scene.addChild(sparks)
}

/*:
### About Particle Effects
 
 TODO: Add section explaining how to add a new particle emitter file.
 
 TODO: Show how the particle emitter can be modified (in Xcode).
 
 TODO: Link to a page explaining what each effect does.
 
*/


/*:
 ### Exercises
 
 TODO: Ask the student to create a new particle emitter. Then get them to create the appearance of snow in this scene (after commenting out the attack code further up.
 
 1. Lorem ipsum
 2. Lorem ipsum

 
 [Previous: Animating a Sprite](@previous) | Page 9 | [Next: Freestyle](@next)
 
 */
