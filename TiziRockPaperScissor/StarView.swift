//
//  StarView.swift
//  TiziRockPaperScissor
//
//  Created by tizianoj on 04/07/23.
//
// Uso l'approccio di https://www.hackingwithswift.com/quick-start/swiftui/how-to-integrate-spritekit-using-spriteview per iniettare scene SpriteKit nelle view SwiftUI. Per un tutorial di base di SpriteKit: https://www.appcoda.com/spritekit-introduction/ e questo fa più o meno lo stesso https://tanaschita.com/20211220-creating-particles-snow-effect-in-spritekit/


/*
 // This came from a playbook sample, lo lascio per reference
 public extension Scene {
    func confetti(duration: Double, color: Color = Color.clear) {
        addParticleEmitter(name: "Confetti", duration: duration, color: color)
    }
}
*/

import SwiftUI
import SpriteKit

class StarScene: SKScene {
    
    let starEmitterNode = SKEmitterNode(fileNamed: "StarParticle.sks")
    // Metodo richiamato allo start
    override func didMove(to view: SKView) {
        // https://developer.apple.com/documentation/spritekit/skscene/creating_a_scene_with_a_transparent_background
        self.backgroundColor = .clear
        view.allowsTransparency = true
        view.backgroundColor = .clear
        guard let starEmitterNode = self.starEmitterNode else { return }
        starEmitterNode.position = CGPoint(x:0, y: size.height)
        starEmitterNode.particleSize = CGSize(width: 30, height: 30)
        starEmitterNode.particlePositionRange=CGVector(dx:600,dy:600)
        addChild(starEmitterNode)
        
    }
    
    // Il tutorial fa anche questo, non mi è chiaro quali casi gestisca
    // (ottimizzazione se cambio orientation?
    /*
    override func didChangeSize(_ oldSize: CGSize) {
            guard let starEmitterNode = starEmitterNode else { return }
            starEmitterNode.particlePosition = CGPoint(x: size.width/2, y: size.height)
            starEmitterNode.particlePositionRange = CGVector(dx: size.width, dy: size.height)
        }
     */
}

struct StarView: View {
    var scene: SKScene {
        let scene = StarScene()
        scene.size = CGSize(width: 300, height: 300)
        scene.scaleMode = .aspectFill
        return scene
    }

    var body: some View {
        SpriteView(scene: scene, options: [.allowsTransparency]).ignoresSafeArea()
    }
}

struct StarView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
                StarView()
            }
            .background(LinearGradient(gradient: Gradient(colors: [.blue, .green]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()).padding(0)
    }
}
