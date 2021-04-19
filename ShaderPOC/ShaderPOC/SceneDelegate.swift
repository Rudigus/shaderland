import UIKit
import SceneKit
import SpriteKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let shaderViewController = ShaderViewController()
        shaderViewController.setObjectGeometry(SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0))
        let objectTexture = SKTexture(imageNamed: "checkerboard")
        objectTexture.filteringMode = .nearest
        shaderViewController.setObjectTexture(objectTexture)
        window.rootViewController = shaderViewController
        window.makeKeyAndVisible()
        self.window = window
    }

}
