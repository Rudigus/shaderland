import PlaygroundSupport
import SceneKit
import SpriteKit
import Module

PlaygroundPage.current.needsIndefiniteExecution = true
//PlaygroundPage.executionMode = .stepSlowly
let shaderViewController = ShaderViewController()
PlaygroundPage.current.setLiveView(shaderViewController)
shaderViewController.setObjectGeometry(SCNSphere(radius: 0.5))
let objectTexture = SKTexture(imageNamed: "checkerboard")
objectTexture.filteringMode = .nearest
shaderViewController.setObjectTexture(objectTexture)
