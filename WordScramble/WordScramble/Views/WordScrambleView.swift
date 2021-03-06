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
    
    @State var displayHelpText = false
    
    
    @Environment(\.colorScheme) var colorScheme
    
//    init() {
//        UITableViewCell.appearance().backgroundColor = .clear
//        UITableView.appearance().backgroundColor = .clear
//    }
    
    func submitAnswer() {
        do {
           try viewModel.makeWordSubmission(newWordSubmission)
            displayError = false
        } catch {
            displayError = true
        }
    }
    
    
    var body: some View {
        ZStack {
            BackgroundGradientView()
            VStack {
                
                HStack {
                    Button() {
                        displayHelpText = true
                    } label: {
                        Image(systemName: "questionmark.circle")
                                .frame(minHeight: 30)
                                .foregroundColor(.appBlue)
                                .padding(.bottom)
                                .imageScale(.large)
                    }
                    Spacer()
                    Text("WordScramble")
                        .font(.largeTitle)
                        .fontWeight(.thin)
                        .padding(.bottom)
                    Spacer()
                    Button() {
                        viewModel.resetRootWord()
                        self.newWordSubmission = ""
                        self.displayError = false
                    } label: {
                        Image(systemName: "arrow.clockwise.circle")
                                .frame(minHeight: 30)
                                .foregroundColor(.appBlue)
                                .padding(.bottom)
                                .imageScale(.large)
                    }
                }
                .frame(maxHeight: 40, alignment: .top)
                
                Text("Using the letters in the word below, how many words can you spell?")
                    .font(.callout)
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                    .padding(.bottom)
                    
                Text("Score: \(viewModel.playerScore)")
                    .font(.headline)
                    .fontWeight(.regular)
                
                Text(viewModel.rootWord.uppercased())
                    .font(.title2)
                    .fontWeight(.semibold)

                HStack {
                
                    TextField("Enter answer here", text: $newWordSubmission)
                        .textCase(.uppercase)
                        .padding(5)
                        .frame(minHeight: 25)
                        .background {
                            RoundedRectangle(cornerRadius: 5).fill(Color.appTextBackground)
                        }
                        .border(displayError ? Color.appErrorRed : .clear, width: 2)
                        .onSubmit {
                            submitAnswer()
                        }
                    Button() {
                        submitAnswer()
                    } label: {
                        ZStack {
                            Capsule(style: .circular)
                                .frame(width: 70, height: 30, alignment: .center)
                                .foregroundColor(.appBlue)
                            Text("Submit")
                                .foregroundColor(.appInvertedText)
                        }
                    }
                }
                if displayError {
                    VStack {
                        Text("\(viewModel.errorTitle)")
                            .bold()
                            .padding(.bottom)
                        Text("\(viewModel.errorMessage)")
                            .padding(.bottom)
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: .infinity, maxHeight: 120, alignment: .center)
                    .background {
                        Rectangle()
                            .background(.ultraThinMaterial)
                            .border(displayError ? Color.appErrorRed : .clear, width: 2)
                    }
                }
                
                if viewModel.submittedAnswers.count > 0 {
                    List(viewModel.submittedAnswers) { item in
                        HStack {
                            Text("\(item.pointValue)")
                            Text("\(item.word.uppercased())")
                                .bold()
                        }
                    }
                    .listStyle(.automatic)
                    .cornerRadius(5)
                    .scrollContentBackground(
                        Color.appInvertedText.opacity(0.15)
                    )
                }
                Spacer()
            } // End of VStack
                .padding()
            
        } // End of ZStack

            .alert(isPresented: $displayHelpText, content: {
                Alert(title: Text("Instructions"),
                      message: Text(viewModel.gameInstructions),
                      dismissButton: .default(Text("Okay"), action: {
                    displayHelpText = false
                }))
            })
            .navigationTitle("WordScramble")
            .statusBar(hidden: true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WordScrambleView()
    }
}
