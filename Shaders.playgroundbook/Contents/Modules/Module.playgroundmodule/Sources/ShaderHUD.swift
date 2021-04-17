
import SpriteKit
import SceneKit

public class ShaderHUD: SKScene {
    
    var sceneView: SCNView?
    
    override init(size: CGSize) {
        super.init(size: size)
    }
    
    init(size: CGSize, sceneView: SCNView) {
        super.init(size: size)
        self.sceneView = sceneView
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    func setup() {
        setupPauseButton()
    }
    
    func setupPauseButton() {
        guard let sceneView = sceneView else { return }
        let pauseButton = ImageButton(imageNamed: "pause_button")
        pauseButton.color = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        pauseButton.colorBlendFactor = 1
        pauseButton.size = CGSize(width: 0.1, height: 0.1)
        pauseButton.position = CGPoint(x: sceneView.bounds.width / 2, y: 0.2)
        pauseButton.isUserInteractionEnabled = true
        pauseButton.tapClosure = {
            sceneView.isPlaying.toggle()
            sceneView.allowsCameraControl.toggle()
            if sceneView.isPlaying {
                pauseButton.texture = SKTexture(imageNamed: "pause_button")
            } else {
                pauseButton.texture = SKTexture(imageNamed: "play_button")
            }
        }
        addChild(pauseButton)
    }
    
}
