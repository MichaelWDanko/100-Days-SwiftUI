//
//  WordScrambleModel.swift
//  WordScramble
//
//  Created by Michael Danko on 7/9/22.
//

import Foundation
import UIKit

enum ValidationErrors: Error {
    case wordNotPossible
    case wordNotSpelledCorrectly
    case wordNotOriginal
}

struct WordScrambleModel {
    
    public var wordArray = [String]()
    public var rootWord = ""
    
    public var guessedWords = Set<String>()
    public var submittedAnswers = [SubmittedAnswer]()
    
    public var playerScore = 0
    
    public var errorTitle = ""
    public var errorMessage = ""
    
    init() {
        loadWordFile()
        resetRootWord()
    }
    
    mutating func loadWordFile() {
        if let fileURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let fileContents = try? String(contentsOf: fileURL) {
                self.wordArray = fileContents.components(separatedBy: "\n")
                return
            }
        }
        fatalError("The text file `start.txt` was unable to be loaded.")
    }
    
    mutating func resetRootWord() {
        self.rootWord = self.wordArray.randomElement() ?? "ravenger"
        self.playerScore = 0
    }
    
    mutating func makeWordSubmission(_ answer: SubmittedAnswer) throws {
        
        if isWordPossible(answer.word) == false { throw ValidationErrors.wordNotPossible }
       
        if isWordSpelledCorrectly(answer.word) == false { throw ValidationErrors.wordNotSpelledCorrectly }
            
        if isWordOriginalGuess(answer.word) == false { throw ValidationErrors.wordNotOriginal }
        
        saveSubmittedAnswer(answer: answer)
    }
    
    
    mutating func isWordPossible(_ submittedWord: String) -> Bool {
        var rootWordCopy = self.rootWord

        for letter in submittedWord {
            if let letterPosition = rootWordCopy.firstIndex(of: letter) {
                rootWordCopy.remove(at: letterPosition)
            } else {
                self.errorTitle = "Not possible"
                self.errorMessage = "The submitted word could not be made with the letters in the original word."
                return false
            }
        }
        return true
        
    } // End of `isWordPossible` function
    
    mutating func isWordSpelledCorrectly(_ submittedWord:String) -> Bool {
        
        // The following is Objective-C code from the HWS project
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: submittedWord.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: submittedWord, range: range, startingAt: 0, wrap: false,language: "en")
        
        errorTitle = "Not a word / Spelled incorrectly"
        errorMessage = "The submitted word is either not a real word or is spelled incorrectly."

        // This code checks to see if the location of the misspelled word is `NSNotFound` or the Obj-C equivalent of `nil`.
        return misspelledRange.location == NSNotFound
        
    } // End of `isWordSpelledCorrectly` function
    
    
    mutating func isWordOriginalGuess(_ submittedWord: String) -> Bool {
        
        if self.guessedWords.contains(submittedWord) {
            // submittedWord is in the list, so it's not original, return false
            errorTitle = "Already submitted"
            errorMessage = "The submitted word has already been submitted."
            return false
        } else {
            return true
        }
    } // End of `isWordOriginalGuess` function
    
    
    mutating func saveSubmittedAnswer(answer: SubmittedAnswer) {
        
        print("Calling saveSubmittedAnswer")
        // Need to add word to the list of words already submitted.
        guessedWords.insert(answer.word)
        submittedAnswers.insert(answer, at: 0)
        
        // Need to update the player's score
        playerScore += answer.pointValue
    } // End of saveSubmittedAnswer function
}
