import PlaygroundSupport
import SceneKit
import Module

PlaygroundPage.current.needsIndefiniteExecution = true
//PlaygroundPage.executionMode = .stepSlowly
let shaderViewController = ShaderViewController()
PlaygroundPage.current.setLiveView(shaderViewController)
shaderViewController.setObjectGeometry(SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0))
