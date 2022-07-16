//
//  WordScrambleViewModel.swift
//  WordScramble
//
//  Created by Michael Danko on 7/8/22.
//

import Foundation
import UIKit
import SwiftUI


class WordScrambleViewModel: ObservableObject {
    
    @Published var model = WordScrambleModel()
    
    //MARK: WordScrambleViewModel variables
    var rootWord: String {
        model.rootWord
    }
    
    var playerScore: Int {
        model.playerScore
    }
    
    var errorTitle: String {
        model.errorTitle
    }
    
    var errorMessage: String {
        model.errorMessage
    }
    
    var submittedAnswers: [SubmittedAnswer] {
        model.submittedAnswers
    }
    
    var gameInstructions: String {
        model.gameInstructions
    }
    
    //MARK: WordScrambleViewModel functions
    
    func resetRootWord() {
        model.resetRootWord()
    }
    
    init() {
        
    }

    func makeWordSubmission(_ word: String) throws {
        let answer = SubmittedAnswer(word: word.lowercased().trimmingCharacters(in: .whitespacesAndNewlines))
        
        do {
            try model.makeWordSubmission(answer)
        } catch {
            throw error
        }
    } // End of makeWordSubmission

}
