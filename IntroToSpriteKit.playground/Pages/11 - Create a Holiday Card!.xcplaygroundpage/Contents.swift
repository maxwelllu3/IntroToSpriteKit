/*:
 ## Create a Holiday Card!
 
 Now that you've explored a bit, create an animated holiday card!
 
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
### Useful Resources

#### Sprites

The [Sprite Database](http://spritedatabase.net/) has spritesheets for a wide variety of classic video games.

Of course, you can also draw sprites yourself (using an iPad, or by hand-drawing images and scanning or photographing them).

Note that [using copyrighted assets is permissable for personal use in Canada](https://en.wikipedia.org/wiki/Fair_dealing_in_Canadian_copyright_law), but if you wish to publish your work in any fashion – you need to find image assets with [compatible licensing terms](https://search.creativecommons.org).

[Open Game Art](https://opengameart.org) is another good option for graphics assets for your games or animations.

#### Decompiling Sprite Sheets

To use arrays of images [like we did on page 8](8%20-%20Animating%20a%20Sprite) you'd get very bored very quickly slicing up a spritesheet manually.

Programs exist that do this automatically for you.

1. Download and [install Adobe Air](https://get.adobe.com/air/).
2. Download and [install Shoebox](http://renderhjs.net/shoebox/).

After those programs are installed, you can [use a sprite sheet like this one](http://spritedatabase.net/files/snes/541/Sprite/MarioLuigi.gif), and [feed it into Shoebox like this](http://renderhjs.net/shoebox/extractSprites.htm) to extract the individual images.

 [Previous: Freestyle](@previous) | Page 11
 
 */

