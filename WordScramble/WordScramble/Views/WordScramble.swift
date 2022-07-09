//
//  WordScramble.swift
//  WordScramble
//
//  Created by Michael Danko on 7/8/22.
//

import SwiftUI

struct WordScramble: View {
    
    @StateObject var viewModel = WordScrambleViewModel()
    
    @State var displayError = false
    
    @State var newWordSubmission = ""
    
    var body: some View {
        VStack {
            Text("PLAYER SCORE: \(viewModel.playerScore)")
            Text("ROOT WORD: \(viewModel.rootWord)")
            TextField("Guess a new word", text: $newWordSubmission)
            Button {
                if viewModel.makeWordSubmission(newWordSubmission) == false {
                    displayError = true
                }
                newWordSubmission = ""
                
            } label: {
                Text("Submit")
            }
            Text("Error Title: \(viewModel.errorTitle)")
            Text("Error Message: \(viewModel.errorMessage)")
        }


    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WordScramble()
    }
}
