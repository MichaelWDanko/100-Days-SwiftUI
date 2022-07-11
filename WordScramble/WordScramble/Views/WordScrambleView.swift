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
    
    var gameInstructions: String = "This is how you play"
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
            ZStack {
                LinearGradient(colors: [.appOrange, .appPurple, .appBlue],
                               startPoint: .topTrailing,
                               endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                    .opacity(0.80)
                VStack {
                    
                    HStack {
                        Button() {
                            displayHelpText = true
                        } label: {
                            Image(systemName: "questionmark.circle")
                                    .frame(minHeight: 30)
                                    .foregroundColor(.appBlue)
                                    .padding(.bottom)
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
                            .padding(5)
                            .frame(minHeight: 25)
                            .background {
                                RoundedRectangle(cornerRadius: 5).fill(Color.appTextBackground)
                            }
                        Button() {
                            print("submitted; attempting to call function that might throw")
                            
                            do {
                               try viewModel.makeWordSubmission(newWordSubmission)
                            } catch {
                                print("caught an error within the view")
                                displayError = true
                            }
                            
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
                        ZStack {
                            Rectangle()
                                .background(.thinMaterial)
                            VStack {
                                Text("Error Title: \(viewModel.errorTitle)")
                                Text("Error Message: \(viewModel.errorMessage)")
                            }
                        }
                    }
                   
                    Spacer()
                
                } // End of VStack
                    .padding()
    
            } // End of ZStack

            .alert(isPresented: $displayHelpText, content: {
                Alert(title: Text("Instructions"),
                      message: Text(gameInstructions),
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
