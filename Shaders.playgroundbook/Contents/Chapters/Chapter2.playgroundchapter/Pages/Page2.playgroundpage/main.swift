/*:
 
 # Sandbox
 
 Here you'll be able to mess with the code and do whatever you want. Have fun :)
 
 */
import PlaygroundSupport
import SceneKit
import SpriteKit
import Module

// Basic initialization of our live view
let shaderViewController = ShaderViewController()
PlaygroundPage.current.setLiveView(shaderViewController)

// You can choose the 3D geometric shape you want, or even create a custom one.
shaderViewController.setObjectGeometry(SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0))

// You can choose the texture that will be applied to your shape. If you don't want any, comment the three lines below.
let objectTexture = SKTexture(imageNamed: "checkerboard")
objectTexture.filteringMode = .nearest
shaderViewController.setObjectTexture(objectTexture)

// Vertex Shader code, or should I say, Geometry Shader Modifier code...
let geometryShaderCode = """
if (_geometry.position.y > 0) {
  _geometry.position.x += 0.5 * sin(u_time * 4);
  _geometry.position.y += 0.5 * sin(u_time * 2);
}
"""
shaderViewController.setObjectShader(geometryShaderCode, .geometry)

// Fragment Shader code, or should I say, Surface Shader Modifier code...
let surfaceShaderCode = """
if (_surface.diffuse.r > 0) {
  _surface.diffuse = vec4(1, 0.5 + cos(u_time * 2) / 2, 0, 1);
}
"""
shaderViewController.setObjectShader(surfaceShaderCode, .surface)
