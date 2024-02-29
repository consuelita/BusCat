//
//  FrameView.swift
//  BusCat
//
//  Created by Mafalda on 7/26/23.
//

import SpriteKit
import SwiftUI

// A simple game scene with falling boxes
class GameScene: SKScene {
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }
}

// A sample SwiftUI creating a GameScene and sizing it
// at 300x400 points
struct FrameView: View {
    var scene: SKScene {
        let scene = GameScene()
        scene
        scene.size = CGSize(width: 300, height: 400)
        scene.scaleMode = .fill
        return scene
    }

    var body: some View {
        SpriteView(scene: scene)
            .frame(width: 300, height: 400)
            .ignoresSafeArea()
    }
}


struct FrameView_Previews: PreviewProvider {
    static var previews: some View {
        FrameView()
    }
}
