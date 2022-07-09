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
    
    init() {
        
    }

    func makeWordSubmission(_ word: String) -> Bool {
        let answer = SubmittedAnswer(word: word.lowercased().trimmingCharacters(in: .whitespacesAndNewlines))
        return model.makeWordSubmission(answer)
        
    } // End of makeWordSubmission

}
