
import UIKit
import SceneKit
import PlaygroundSupport

public class ShaderViewController: UIViewController {
    
    var sceneView: SCNView!
    var shaderScene: ShaderScene!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupScene()
    }
    
    func setupView() {
        self.sceneView = SCNView()
        sceneView.allowsCameraControl = true
        sceneView.autoenablesDefaultLighting = true
        //sceneView.showsStatistics = true
        sceneView.isPlaying = true
        self.view = sceneView
    }
    
    func setupScene() {
        self.shaderScene = ShaderScene()
        shaderScene.background.contents = #colorLiteral(red: 0.25882352941176473, green: 0.7568627450980392, blue: 0.9686274509803922, alpha: 1.0)
        sceneView.scene = shaderScene
        shaderScene.setView(view: sceneView)
    }
    
}

extension ShaderViewController: PlaygroundLiveViewMessageHandler {
    
    public func receive(_ message: PlaygroundValue) {
        switch message {
        case let .dictionary(info):
            guard case .string(let type) = info["type"] else { return }
            if type == ShaderType.geometry.rawValue {
                if case .string(let sourceCode) = info["sourceCode"] {
                    shaderScene.changeShaderModifier(sourceCode, .geometry)
                }
            }
        default:
            break
        }
    }
    
}
