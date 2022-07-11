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
    func resetRootWord() {
        model.resetRootWord()
    }
    
    init() {
        
    }

    func makeWordSubmission(_ word: String) throws {
        print("calling makeWordSubmission inside the ViewModel")
        
        let answer = SubmittedAnswer(word: word.lowercased().trimmingCharacters(in: .whitespacesAndNewlines))
        
        do {
            try model.makeWordSubmission(answer)
        } catch {
            print("error caught within makeWordSubmission inside the ViewModel")
            throw error
        }
    } // End of makeWordSubmission

}
