Where the real work begins.

To put this project short: Let's use OpenGL.

Every graphicals projects I worked on so far where more about mathematics than technology. Doing all my work naively using the CPU and not trying to optimize anything to get an acceptable fps during rendering. As I already said, I love mathematics, so I actually enjoyed it.
But can I make a video games with an engine that needs more than 3 seconds to render a textured sphere ? Well yes I could maybe think about creating a Point&Click game or another kind that doesn't require a fluid 60fps gameplay and gives you a 5 minutes loading screen before showing a static image. But for unknown reasons I'm not really interested in that idea and that's why I stepped into the world of **GPUs** !

This project started from a school project that required us to parse and render 3D [obj files](https://en.m.wikipedia.org/wiki/Wavefront_.obj_file) using OpenGL and the programming language we want.

To choose the language, as someone who often praise the idea of trying new things to not live on your assets and expand your knowledge base, I have chosen C++ so I could totally stay in my comfort zone ! But also because it seems to be the most logical choice to use when developing video games.
> I did not know Rust back then but if I had to restart it all, I would totally use it with Vulkan now.

I started this project by following [a tutorial on OpenGL](https://learnopengl.com/).
But as I continued to learn about GPU, shaders, game engines and different rendering solutions, I tried to put everything in the same project and make all of those compatible between each other.
All rendering methods are using the same protocol to write in an image buffer using the same drawing behavior.
That’s how I now have my own graphical engine that can handle some of the big game engine functionalities like drawing ~~models of 3D waif~~ 3D meshes of all kind, animating particle systems, lighting a scene, skeletal animation and more...

I invite you to look at the presentation of the project [here](https://github.com/amasson42/GLSScene).

### HumanGLAnimator

Before importing assets I wanted to create a cubic minecraft like character. To create such, I could create it in code to create a simple array that defines a simplist mesh. It's only 8 vertices per articulations and cubes are easy to make.

But making animations is more complex. So I created a tool to help me create and visualise animations so I could export them to a format that the engine is able to parse.

I made this tool on macOS in Swift language using AppKit for the interface, SceneKit for rendering and ModelIO to export animations.

## Metal

After going this far with openGL and being much more familiar with usage of GPU, shaders and mathematics for video games rendering, I wanted to see how to use Metal, another 3D framework, but developed by Apple exlusively for their own hardware (kind of like everything Apple does). So I implemented most of the features I had from GLScene into Metal as well.
