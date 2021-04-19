//#-hidden-code
import PlaygroundSupport
import Module
//#-end-hidden-code
/*:

 # Fragment Shader
 The Fragment Shader is the Vertex Shader counterpart for fragments. We can say, in simple terms, that fragments are what will eventually become pixels on our screen. Like the way Vertex Shader works, Fragment Shader will also be able to change attributes of a fragment, most notably the color.
 
 Someone could think: "That's interesting, but aren't there easier ways to change color of things?". Yes, that's generally correct for simple color modifications, like turning a fully red sphere into a fully blue one. However, Fragment Shaders can go beyond that. A nice example is image filters. When you use an image filter, the result you get is dependent on the original image. Likewise, the Fragment Shader will be invoked for every individual fragment, and the results of those invocations will be dependent on the original fragments. This lets us have a great degree of freedom when coloring objects.
 
 Now, let's put to test what we have learned.
 
 - Note:
   The color system used here is RGBA, which means the colors are composed of three color channels / components (red, green and blue) and one transparency channel / component (alpha). That transparency channel is really useful to make interesting effects besides the usual coloring.
 
 **Task**: Change the Pattern
 1. Take a look at the scene on the right. There, we have a sphere with a checkerboard pattern on top of a plane.
 2. If you want, you can try doing things like rotating the scene and zooming it in / out with gestures.
 3. Check the code below and then tap `Run the Code` on the right. Observe what happens to the sphere.
 4. Finally, try changing the first line to `if (_surface.diffuse.r > 0) {`. Can you guess how does it work?
 */
//#-hidden-code
let surfaceShaderCode = """
//#-end-hidden-code
//#-editable-code
if (1 == 1) {
  _surface.diffuse = vec4(1, 0, 0, 1);
}
//#-end-editable-code
//#-hidden-code
"""

public func sendSurfaceShaderCode() {
    guard let remoteView = PlaygroundPage.current.liveView as? PlaygroundRemoteLiveViewProxy else {
        fatalError("Always-on live view not configured in this page's LiveView.swift")
    }
    
    remoteView.send(.dictionary(["type": .string(ShaderType.surface.rawValue), "sourceCode": .string(surfaceShaderCode)]))
}

sendSurfaceShaderCode()
//#-end-hidden-code
/*:
 * Callout(Explanation):
   The explanation will follow the format presented in the Vertex Shader page, so let's get going. Here is a transcription of the logic used for the 3rd step of *Change the Pattern*:
 
    "First, check if 1 is equal to 1. If it is, change the fragment's color to red. Otherwise, leave the fragment unmodified."
 
    Checking if 1 is equal to 1 is definitely not needed. I have just put it there so you only need to change one line in the 4th step. I apologize for the eventual confusion.
 
    Transcription of the 4th step:
 
    "First, check if the red color component of the fragment's color is greater than 0. If it is, change the fragment's color to red. Otherwise, leave the fragment unmodified."
 
    Here we check if a color component value fits a certain criterion. This way, we are able to change only the color of the fragments we want. Why 0? First, in shaders the color components are generally normalized, which means their values will be from 0 to 1 (both inclusive). Second, the original texture is a pure black, pure white checkerboard, so the red component value is 0 for black and 1 for white (green and blue could also have been used, the same applies). Third, the checkerboard texture is using the nearest neighbor filtering mode, so no intermediate colors will appear.
 
 Our journey is ending very soon, we just need to visit our last destination: the [Conclusion](@next)!
 */
