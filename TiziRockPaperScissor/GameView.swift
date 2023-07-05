//
//  GameView.swift
//  TiziRockPaperScissor
//
//  Created by tizianoj on 20/06/23.
//  Based on https://www.youtube.com/watch?v=lB4FiWAbefM
//
//  For animations: see
// https://developer.apple.com/tutorials/swiftui/animating-views-and-transitions
//
// For font sizing:
// https://georgegarside.com/blog/ios/swiftui-equal-scaling-text-size-to-fit/
//
//
// Chaining animations:
// https://stackoverflow.com/questions/56907344/chaining-animations-in-swiftui
// https://stackoverflow.com/questions/64948520/swiftui-chaning-animations


import SwiftUI

enum Outcome : String {
    case win = "You won!"
    case lose = "You lost"
    case tie = "It's a tie!"
}

struct GameView: View {
    var DEBUG = false
    var scene = StarScene()
    
    @State var computerChoice: Choices = .paper
    @State var gameOutcome: Outcome = .win
    @State var showOutcome = false
    @State var showEffect = false
    @State var wins = 0
    @State var losses = 0
    @State var round = 0
    @State var showAlert = false
    
    @State var playerChoice = Choices.scissors
    @State var showPlayerChoice = false
    
    
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if (showEffect && gameOutcome == .win) {
                    StarView()
                }
                VStack {
                    VStack {
                        CircledImage(image: Image("happy"), label: "Computer").scaleEffect(1.5)
                    }.frame(width: geometry.size.width, height: geometry.size.height*0.22)
                    VStack {
                        
                        if DEBUG || showOutcome {
                            ChoiceView(choice: computerChoice).transition(.slide.animation(.easeInOut(duration: 0.5)))
                        }
                        
                    }.frame(width: geometry.size.width, height: geometry.size.height*0.13)
                    
                    VStack {
                        
                        if DEBUG || showOutcome {
                            Text(gameOutcome.rawValue.uppercased())
                                .animation(.easeInOut(duration: 1))
                                .font(.system(size: 200, design:.rounded).uppercaseSmallCaps())
                                .foregroundStyle(.black)
                                .shadow(color: .white, radius: 1)
                                .minimumScaleFactor(0.01)
                                .lineLimit(1)
                            
                        }
                    }.frame(width: geometry.size.width*0.9, height: geometry.size.height*0.13)
                    
                    
                    VStack {
                        Spacer().frame(width:10, height:30)
                        PlayerChoiceView(choice: $playerChoice, showChoice: $showPlayerChoice) {
                            round += 1
                            let index :Int = Int.random(in: 0..<Choices.allCases.count)
                            computerChoice = Choices.allCases[index]
                            if playerChoice > computerChoice {
                                gameOutcome = .win
                                wins += 1
                            } else if playerChoice == computerChoice {
                                gameOutcome = .tie
                            }
                            else {
                                gameOutcome = .lose
                                losses += 1
                            }
                            showEffect = false // senza tempo di animazione
                            // Animazione in uscita
                            withAnimation {
                                showOutcome = false
                            }
                            // Animazione in ingresso da evnto asincrono
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                withAnimation {
                                    showOutcome = true
                                    showEffect = true
                                }
                            }
                        }
                        Spacer()
                        CircledImage(image: Image("erza"), label: "You").scaleEffect(1.5)
                        
                    }.frame(width: geometry.size.width, height: geometry.size.height*0.42)
                    
                    VStack {
                        Text("\(wins) win(s), \(losses) loss(es) in \(round) rounds")
                            .foregroundStyle(.black)
                            .shadow(color: .white, radius: 1)
                    }.frame(width: geometry.size.width, height: geometry.size.height*0.10)
                }
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(DEBUG: true)
    }
}
