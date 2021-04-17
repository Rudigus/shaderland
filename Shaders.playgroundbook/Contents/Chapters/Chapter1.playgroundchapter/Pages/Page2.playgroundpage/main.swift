/*:

 # Vertex Shader
 
 At the Vertex Shader stage, as you may have guessed, is the stage where we work with the vertices of the object we want to draw. We can change their attributes, like position and color. I think it will all become clear with an example!
 
 Imagine you want to draw a deformed cube. You could specify the attributes of its vertices, like the position, already deformed and tell the computer to draw it on screen. That is perfectly fine if that is all you want to do. However, what if you want to draw a normal cube too? Or even, a bigger deformed cube? Then you would also have to provide all the attributes for those. Besides, you would have to calculate the deformed attributes in some way in order to provide them.
 
 Fear not, shaders can help us with that. Instead of doing the above process, we can tell the computer to draw a normal cube, and if we want to deform it, we can provide a Vertex Shader for that! This way, the Vertex Shader will:
 
 1. receive the vertex attributes of the cube
 2. execute its algorithm for every vertex
 3. return the already deformed vertex attributes
 
 Pretty nice, is it not? Now, I think we are ready to test this in practice. Try doing the following task.
 
 **Task**: Deform a Cube
 1. Tap `Run the Code` on the right
 */
//#-hidden-code
let shaderCode = """
//#-end-hidden-code
//#-editable-code
if (_geometry.position.y > 0) {
  _geometry.position.x += 0.5 * sin(u_time * 4);
}
//#-end-editable-code
//#-hidden-code
"""

public func sendShaderCode() {
    guard let remoteView = PlaygroundPage.current.liveView as? PlaygroundRemoteLiveViewProxy else {
        fatalError("Always-on live view not configured in this page's LiveView.swift")
    }
    
    remoteView.send(.string(shaderCode))
}
sendShaderCode()
//#-end-hidden-code
