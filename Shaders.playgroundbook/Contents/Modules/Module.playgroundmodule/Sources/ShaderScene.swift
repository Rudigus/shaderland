
import SceneKit

public class ShaderScene: SCNScene {
    
    public override init() {
        super.init()
        setupCameraNode()
        setupBoxNode()
    }
    
    func setupCameraNode() {
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(0, 0, 10)
        self.rootNode.addChildNode(cameraNode)
    }
    
    func setupBoxNode() {
        let boxMaterial = SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0)
        boxMaterial.firstMaterial?.diffuse.contents = #colorLiteral(red: 0.27450980392156865, green: 0.48627450980392156, blue: 0.1411764705882353, alpha: 1.0)
        let box = SCNNode(geometry: boxMaterial)
        rootNode.addChildNode(box)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
