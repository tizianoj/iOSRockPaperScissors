//
//  ContentView.swift
//  TiziRockPaperScissor
//
//  Created by tizianoj on 20/06/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            VStack {
                    GameView()
            }
        .background(LinearGradient(gradient: Gradient(colors: [.cyan, .pink]), startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea())
        .padding(0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
