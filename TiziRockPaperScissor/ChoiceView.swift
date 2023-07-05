//
//  ChoiceView.swift
//  TiziRockPaperScissor
//
//  Created by tizianoj on 23/06/23.
//

import SwiftUI

struct ChoiceView: View {
    var choice : Choices?
    var body: some View {
        if let uwChoice = self.choice {
            ZStack {
                if uwChoice == .paper {
                    CircledImage(image: Image("paper"))
                }
                if uwChoice == .rock {
                    CircledImage(image: Image("rock"))
                }
                if uwChoice == .scissors {
                    CircledImage(image: Image("scissors"))
                }
                Text(uwChoice.rawValue).font(.system(size: 40)).offset(x:+50, y:+45).shadow(radius: 5)
            }.padding(10)
            
        }
        else {
            // Spacer().frame(height: 100)
        }
    }
}

struct ChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            ChoiceView(choice: .rock)
            ChoiceView(choice: .paper)
            ChoiceView(choice: .scissors)
            ChoiceView()
            
        }
    }
}
