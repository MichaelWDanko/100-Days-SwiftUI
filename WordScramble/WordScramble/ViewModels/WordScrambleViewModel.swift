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
    
    @Published var wordArray = [String]()
    @Published var rootWord = ""
    
    @Published var guessedWords = Set<String>()
    @Published var submittedAnswers = [SubmittedAnswer]()
    
    @Published var playerScore = 0
    
    @Published var errorTitle = ""
    @Published var errorMessage = ""
    
    init() {
        loadWordFile()
        setNewRootWord()
    }
    
    func loadWordFile() {
        if let fileURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let fileContents = try? String(contentsOf: fileURL) {
                wordArray = fileContents.components(separatedBy: "\n")
                return
            }
        }
        fatalError("The text file `start.txt` was unable to be loaded.")
    }
    
    func setNewRootWord() {
        rootWord = wordArray.randomElement() ?? "ravenger"
    }
    
    func makeWordSubmission(_ word: String) -> Bool {
        
        let answer = SubmittedAnswer(word: word.lowercased().trimmingCharacters(in: .whitespacesAndNewlines))
        
        print("The value of `answer` is: `\(answer)`")
    
        if isWordPossible(answer.word) == false {
//            print("isWordPossible failed")
            
            errorTitle = "Not possible"
            errorMessage = "The submitted word could not be made with the letters in the original word."
            return false
        }
        
        
        if isWordSpelledCorrectly(answer.word) == false {
//            print("isWordSpelledCorrectly failed")
            
            errorTitle = "Spelled incorrectly"
            errorMessage = "The submitted word is not spelled correctly."
            return false
        }
        
        
        if isWordOriginalGuess(answer.word) == false {
//            print("isWordOriginalGuess failed")
            
            errorTitle = "Already submitted"
            errorMessage = "The submitted word has already been submitted."
            return false
        }
        
        // Need to add word to the list of words already submitted.
        guessedWords.insert(answer.word)
        submittedAnswers.insert(answer, at: 0)
        
        // Need to update the player's score
        playerScore += answer.pointValue
        
        // If no other errors have occurred, we need to return a true
        return true
        
    } // End of makeWordSubmission
    
    
    func isWordPossible(_ submittedWord: String) -> Bool {
        var rootWordCopy = self.rootWord

        for letter in submittedWord {      
            if let letterPosition = rootWordCopy.firstIndex(of: letter) {
                rootWordCopy.remove(at: letterPosition)
            } else {
                return false
            }
        }
        return true
        
    } // End of `isWordPossible`
    
    
    func isWordSpelledCorrectly(_ submittedWord:String) -> Bool {
        
        // The following is Objective-C code from the HWS project
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: submittedWord.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: submittedWord, range: range, startingAt: 0, wrap: false,language: "en")

        // This code checks to see if the location of the misspelled word is `NSNotFound` or the Obj-C equivalent of `nil`.
        return misspelledRange.location == NSNotFound
        
    } // End of `isWordSpelledCorrectly`
    
    
    func isWordOriginalGuess(_ submittedWord: String) -> Bool {
        return self.guessedWords.contains(submittedWord) == true ? false : true
        
    } // End of `isWordOriginalGuess`
    

    
    
    
}
