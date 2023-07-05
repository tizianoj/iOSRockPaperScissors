//
//  PlayerChoiceView.swift
//  TiziRockPaperScissor
//
//  Created by tizianoj on 23/06/23.
//
// ForEach and id: https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-views-in-a-loop-using-foreach

// Bindings : https://martinlasek.medium.com/swiftui-understanding-binding-8e20269a76bc

import SwiftUI

struct PlayerChoiceView: View {
    @Binding var choice : Choices
    @Binding var showChoice: Bool
    var action: () -> Void
    
    var body: some View {
        HStack {
            ForEach(Choices.allCases) { option in
                Button {
                    self.showChoice = true
                    self.choice = option
                    self.action()
                } label : {
                    ChoiceView(choice: option).scaleEffect(showChoice && (choice == option) ? 1.5 : 1)
                    /*Text(option.rawValue).font(.system(size: 100)).scaleEffect(showChoice && (choice == option) ? 1.5 : 1)
                     */
                }
            }
        }
    }
}


struct PlayerChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        @State var c = Choices.scissors
        @State var showChoice = true
        PlayerChoiceView(choice: $c, showChoice: $showChoice) { }
    }
}
