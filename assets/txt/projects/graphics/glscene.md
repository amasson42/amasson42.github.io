Where the real work begins.

To put this project short: Let's use OpenGL.

Every graphicals projects I worked on so far where more about mathematics than technology. As I already said, I love mathematics, so I actually enjoyed it.
But can I make a video games with an engine that needs more than 3 seconds to render a textured sphere ? Well yes I could maybe think about creating a Point&Click game or another kind that doesn't require a fluid 60fps gameplay and gives you a 5 minutes loading screen before showing a static image. But for unknown reasons I'm not really interested in that idea and that's why I stepped into the world of **GPUs** !

This project started from a school project that required us to parse and render 3D [obj files](https://en.m.wikipedia.org/wiki/Wavefront_.obj_file) using OpenGL and the programming language we want.

To choose the language, as someone who often praise the idea of trying new things to not live on your assets and expand your knowledge base, I have chosen C++ so I could totally stay in my comfort zone ! But also because it seems to be the most logical choice to use when developing video games.
> I did not know Rust back then but if I had to restart it all, I would totally use it with Vulkan now.

I started this project by following [a tutorial on OpenGL](https://learnopengl.com/).
But as I continued to learn about GPU, shaders, game engines and different rendering solutions, I tried to put everything in the same project and make all of those compatible between each other.
All rendering methods are using the same protocol to write in an image buffer using the same drawing behavior.
That’s how I now have my own graphical engine that can handle some of the big game engine functionalities like drawing ~~models of 3D waif~~ 3D meshes of all kind, animating particle systems, lighting a scene, skeletal animation and more...

**Render meshes composed of set of triangles
Transform matrices system hierarchy that can organise meshes in groups**

A scene is composed of node objects `GLS::Node` that have a transformation matrix and an array of child nodes of the same type.
It's a recusive tree organisation that can group nodes together.
When modifying a transformation matrix, it will have an effect on the rendering, but also on the child node that will move along the parent.
All of those nodes also contains properties like a set of renderables objects `GLS::IRenderable`. It's an interface class that is subclassed by anything that can be drawn on screen. Like 3d meshes, particle system, skybox or post-processing effects.

## Instanciated meshes

To optimize some render, we can use instanciated meshes with consist of drawing on model at multiple places in one GPU call. It's mostly used in games to draw things like grass or rocks.

## Asset importing

We can import external 3d scene from popular formats like fbx, dae or gltf. It's mostly done using Assimp to parse a scene from a file, then the result is maped to the coresponding engine class.
Images are also imported but using the famous stb_image repo

## Particle system with OpenCL interoperability

Another project from school was to lean OpenCL to create particle systems.
OpenCL is used to do parallel computation for custom shaders unrelated to rendering. I could then create buffers on the Graphic card and apply massive paralelization calculation on those. It comes really handy when creating things like particle systems. We could have one million particles and make OpenCL update all of their positions *blazingly* fast. Then with a small trick, we can make an interoperability of buffers from both openCL and openGL.

So I merged this project with my engine, turned the particle system into a `GLS::IRenderable` and apply my node transformation to all particles when rendering, then the integration was complete

## Skeletal mesh animations

A famous method to animate characters in 3d graphics is to apply weight painting on a mesh with a skeleton. So that when we move the skeleton, the meshes come along and move linearly.
I had to implement this in my engine to be able to play with it.

### HumanGLAnimator

Before importing assets I wanted to create a cubic minecraft like character. To create such, I could create it in code to create a simple array that defines a simplist mesh. It's only 8 vertices per articulations and cubes are easy to make.

But making animations is more complex. So I created a tool to help me create and visualise animations so I could export them to a format that the engine is able to parse.

I made this tool on macOS in Swift language using AppKit for the interface, SceneKit for rendering and ModelIO to export animations.

## Voxel rendering with geometry shaders

Did I tell you about my animated cubic character ? Well another project from school is to make a voxel engine that render in real-time. I experimented with geometry shader that could generate just the right meshes during the rendering so we could simply send a 3d matrix of blocks to the GPU and the voxel will draw at each frames.
That was a wrong good idea. The rendering took just too long, and for a single chunck of 128x128x128 blocks, the framerate dropped to 20 fps.

A better solution was to bake the chuck into a mesh and render it. The downside of it is that we have to rebuild the mesh when one block changes. It's still better than rebuilding the mesh in the geometry shader at each frames. But to make it less impactful, the chucks were split into smaller 16x16x16 blocks.

## Skybox

Skybox acts as 3d boxes that ignores transformation matrices and simply displays a cube around the camera and is overwritten by any other rendered object.

## Post-process effects

After rendering a frame, we can apply another effect on the framebuffer result using a shader program. We can then apply grayscale to remove colors or using nearest colors to apply a toon effect or many other things where we're only limited by our imagination...

As the position of the camera is also sent to the shader, we can also create custom rendering like ray tracing or ray marching.

The possibilities could be greatly improved if I implemented a multi buffered rendering so the shader could also compute effect using depth, normal or world position along with the color.


# Metal

After going this far with openGL and being much more familiar with usage of GPU, shaders and mathematics for video games rendering, I wanted to see how to use Metal, another 3D framework, but developed by Apple exlusively for their own hardware (kind of like everything Apple does). So I implemented most of the features I had from GLScene into Metal.
