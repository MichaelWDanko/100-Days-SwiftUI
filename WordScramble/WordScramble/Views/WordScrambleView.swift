//
//  WordScramble.swift
//  WordScramble
//
//  Created by Michael Danko on 7/8/22.
//

import SwiftUI

struct WordScrambleView: View {
    
    @StateObject var viewModel = WordScrambleViewModel()
    
    @State var displayError = false
    @State var newWordSubmission = ""
    
    var body: some View {
        VStack(spacing: 30){
            Text("SCORE: \(viewModel.playerScore)")
            Text("ROOT WORD: \(viewModel.rootWord)")
            TextField("Guess a new word", text: $newWordSubmission)
            Button {
                if viewModel.makeWordSubmission(newWordSubmission) == true {
                    displayError = false
                } else {
                    displayError = true
                }
                newWordSubmission = ""
                
            } label: {
                Text("Submit")
            }
            if displayError {
                Text("Error Title: \(viewModel.errorTitle)")
                Text("Error Message: \(viewModel.errorMessage)")
            }
        }.padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WordScrambleView()
    }
}
