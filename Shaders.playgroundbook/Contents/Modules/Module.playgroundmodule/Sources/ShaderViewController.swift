
import UIKit
import SceneKit

public class ShaderViewController: UIViewController {
    
    var sceneView: SCNView!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupScene()
    }
    
    func setupView() {
        self.sceneView = SCNView()
        sceneView.allowsCameraControl = true
        sceneView.autoenablesDefaultLighting = true
        sceneView.showsStatistics = true
        self.view = sceneView
    }
    
    func setupScene() {
        let shaderScene = ShaderScene()
        shaderScene.background.contents = #colorLiteral(red: 0.25882352941176473, green: 0.7568627450980392, blue: 0.9686274509803922, alpha: 1.0)
        sceneView.scene = shaderScene
    }
    
}
