//
//  ImageButton.swift
//  AmeliaDespair
//
//  Created by Rodrigo Matos Aguiar on 24/03/21.
//

import SpriteKit

class ImageButton: SKSpriteNode {

    var tapClosure: (() -> Void)?

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let tapClosure = tapClosure {
            tapClosure()
        }
    }

}
