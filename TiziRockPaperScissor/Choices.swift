//
//  Choices.swift
//  TiziRockPaperScissor
//
//  Created by tizianoj on 21/06/23.
//

import Foundation


enum Choices: String, Identifiable, CaseIterable, Comparable {
    var id: String {
        return self.rawValue
        }
        
    case rock = "✊🏻"
    case paper = "🤚🏻"
    case scissors = "✌🏻"
    
    
    // Sì, le enum supportano metodi e il protocollo Comparable lo prevede
    static func < (a: Choices, b: Choices) -> Bool {
        if a == b {
            return false
        }
        if winsOn(a: a, b: b) {
            return false
        }
        return true
    }
    
    private static func winsOn(a: Choices, b:Choices) -> Bool {
        if a == .rock && b == .scissors  {
            return true
        }
        if a == .scissors && b == .paper {
            return true
        }
        if a == .paper && b == .rock {
            return true
        }
        return false
    }
}
