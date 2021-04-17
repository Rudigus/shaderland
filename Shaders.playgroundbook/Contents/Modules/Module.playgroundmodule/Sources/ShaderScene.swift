
import SceneKit

public class ShaderScene: SCNScene, SCNProgramDelegate {
    
    var view: SCNView?
    var cubeNode: SCNNode?
    
    public override init() {
        super.init()
        setupCamera()
        setupCube()
        setupGround()
        setupAmbientLight()
    }
    
    func getSourceCode(of resourceName: String, type: String) -> String? {
//        let path = playgroundSharedDataDirectory.appendingPathComponent("\(resourceName).\(type)")
        guard let path = Bundle.main.path(forResource: resourceName, ofType: type) else { return nil }
        do {
            let sourceCodeString = try String(contentsOfFile: path, encoding: .utf8)
            return sourceCodeString
        } catch { return nil }
    }
    
    func changeShaderModifier(_ sourceCode: String, _ entryPoint: SCNShaderModifierEntryPoint) {
        guard var cubeGeometry = cubeNode?.geometry, var modifiers = cubeGeometry.shaderModifiers else {
            return
        }
        modifiers[entryPoint] = sourceCode
        cubeGeometry.shaderModifiers = modifiers
    }
    
    func setupCamera() {
        let camera = SCNCamera()
        let cameraNode = SCNNode()
        cameraNode.camera = camera
        cameraNode.position = SCNVector3(0, 3, 7.5)
        cameraNode.eulerAngles = SCNVector3(-0.4, 0, 0)
        rootNode.addChildNode(cameraNode)
    }
    
    func setupCube() {
        let boxGeometry = SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0)
        boxGeometry.firstMaterial?.diffuse.contents = #colorLiteral(red: 0.27450980392156865, green: 0.48627450980392156, blue: 0.1411764705882353, alpha: 1.0)
        var shaderModifiers: [SCNShaderModifierEntryPoint: String] = [:]
//        if let geometrySourceCode = getSourceCode(of: "GeometryShaderModifier", type: "shader") {
//            shaderModifiers[.geometry] = geometrySourceCode
//        }
//        if let surfaceSourceCode = getSourceCode(of: "SurfaceShaderModifier", type: "shader") {
//            shaderModifiers[.surface] = surfaceSourceCode
//        }
        boxGeometry.shaderModifiers = shaderModifiers
        let cubeNode = SCNNode(geometry: boxGeometry)
        rootNode.addChildNode(cubeNode)
        self.cubeNode = cubeNode
    }
    
    func setupGround() {
        let boxGeometry = SCNBox(width: 3, height: 0.1, length: 3, chamferRadius: 0)
        let groundNode = SCNNode(geometry: boxGeometry)
        groundNode.position = SCNVector3(0, -0.55, 0)
        rootNode.addChildNode(groundNode)
    }
    
    func setupAmbientLight() {
        let light = SCNLight()
        light.type = .ambient
        light.intensity = 500
        let lightNode = SCNNode()
        lightNode.light = light
        rootNode.addChildNode(lightNode)
    }
    
    func setupHUD() {
        guard let view = view else { return }
        let shaderHUD = ShaderHUD(size: view.bounds.size, sceneView: view)
        view.overlaySKScene = shaderHUD
    }
    
    func setView(view: SCNView) {
        self.view = view
        setupHUD()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
