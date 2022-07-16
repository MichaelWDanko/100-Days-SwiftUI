//
//  SubmittedAnswerStruct.swift
//  WordScramble
//
//  Created by Michael Danko on 7/9/22.
//

import Foundation

struct SubmittedAnswer: Identifiable {
    var id = UUID().uuidString
    
    var word: String
    
    var pointValue: Int {
        switch word.count {
        case 1...3:
            return (word.count)
        case 4...6:
            return (word.count + 2)
        default:
            return (word.count + 3)
        }
    }
}
