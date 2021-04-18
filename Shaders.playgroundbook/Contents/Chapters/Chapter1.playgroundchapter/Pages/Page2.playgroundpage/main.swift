//#-hidden-code
import PlaygroundSupport
import Module
//#-end-hidden-code
/*:

 # Vertex Shader
 
 The Vertex Shader stage, as you may have guessed, is the stage where we work with the vertices of the object we want to draw. In shaders, we can think of vertices as geometry's vertices, so we would need 8 vertices to draw a cube, for example. At this stage we can change attributes of a vertex, like position and color. I think it will all become clear with an example!
 
 Imagine you want to draw a deformed cube. You could specify the attributes of its vertices, like the position, already deformed and tell the computer to draw it on screen. That is perfectly fine if that is all you want to do. However, what if you want to draw a normal cube too? Or even, a bigger deformed cube? Then you would also have to provide all the attributes for those. Besides, you would have to calculate the deformed attributes in some way in order to provide them.
 
 Fear not, shaders can help us with that. Instead of doing the above process, we can tell the computer to draw a normal cube, and if we want to deform it, we can provide a Vertex Shader for that! This way, the Vertex Shader will:
 
 1. receive the vertex attributes of the cube
 2. execute its algorithm for every vertex
 3. return the now deformed vertex attributes
 
 Pretty nice, is it not? Now, I think we are ready to test this in practice with a little task.
 
 - Note:
   You may pause the scene by tapping the pause button in the bottom half of the scene to save your device's resources.
 
 **Task**: Deform a Cube
 1. Take a look at the scene on the right. There, we have an undeformed cube on top of a plane.
 2. If you want, you can try doing things like rotating the scene and zooming it in / out with gestures.
 3. Check the code below and then tap `Run the Code` on the right. Observe what happens to the cube.
 4. Finally, try changing the second line to `  _geometry.position.x += 0.5 * sin(u_time);`. Can you guess what `u_time` represents?
 */
//#-hidden-code
let geometryShaderCode = """
//#-end-hidden-code
//#-editable-code
if (_geometry.position.y > 0) {
  _geometry.position.x += 0.5;
}
//#-end-editable-code
//#-hidden-code
"""

public func sendGeometryShaderCode() {
    guard let remoteView = PlaygroundPage.current.liveView as? PlaygroundRemoteLiveViewProxy else {
        fatalError("Always-on live view not configured in this page's LiveView.swift")
    }
    
    remoteView.send(.dictionary(["type": .string(ShaderType.geometry.rawValue), "sourceCode": .string(geometryShaderCode)]))
}

sendGeometryShaderCode()
//#-end-hidden-code
/*:
 * Callout(Explanation):
   How does the code above work? Considering that our objective in this playground is understanding shaders in general, the logic behind the code is more important than the way it is written. Here is a transcription of the logic used for the 3rd step of our previous task:
 
    "First, check if the position on the y-axis of some vertex is greater than 0. If it is, increase the vertex's position on the x-axis by 0.5. Otherwise, leave the vertex unmodified."
 
    For clarification of this example, it's useful to know some values. The scene's origin, where the position is 0 for both x and y axes, is located right at the center of the original, undeformed cube. Also, the original cube has sides of length 1.
 
 Now that we have seen the Vertex Shader, it is time for the Fragment Shader. Let's look into it on the [next page](@next).
 */
