//
//  PlayerView.swift
//  TiziRockPaperScissor
//
//  Created by tizianoj on 22/06/23.
//

import SwiftUI

struct CircledImage: View {
    var image: Image
    var label = ""

    var body: some View {
        VStack {
            image.resizable()
                .scaledToFill()
            // .scaledToFit()
                .frame(width:90, height: 90)
                .background(.black)
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.white, lineWidth: 4)
                }
                .shadow(radius: 7)
            if self.label != "" {
                Text(self.label)
                    .foregroundStyle(.black)
                    .shadow(color: .white, radius: 1)
            }
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        CircledImage(image: Image("erza"), label: "Erza Scarlet")
    }
}
