//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Michael Danko on 7/3/22.
//

import SwiftUI

class FlagPickerViewModel: ObservableObject {
    
    @Published var countries: [String] = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    
    @Published var correctAnswer = Int.random(in: 0..<3)
    @Published var score: Int = 0
    @Published var displayWrongAnswerAlert = false
    
    init() {}
    
    func submitAnswer(selection: Int){
        if selection == self.correctAnswer {
            print("The chosen answer was \(selection) and it is correct")
            self.score += 1
            self.resetQuestion()
        } else {
            print("The chosen answer was \(selection) but the correct answer was \(correctAnswer)")
            self.displayWrongAnswerAlert = true
        }
    } // end of `submitAnswer`
    
    func resetQuestion() {
        self.countries.shuffle()
        correctAnswer = Int.random(in: 0..<3)
    } // end of `resetQuestion`
    
}


struct FlagPicker: View {
    
    @StateObject var flagPickerViewModel = FlagPickerViewModel()
    @State var showPopup: Bool = false
    
    var body: some View {
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [.blue, .mint]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            Color.secondary
                .opacity(0.50)
                .ignoresSafeArea()
            
            VStack(spacing: 30){
                VStack {
                    Text("Tap the flag for")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(.bottom)
                    
                    Text(flagPickerViewModel.countries[flagPickerViewModel.correctAnswer])
                        .font(.title)
                        .foregroundColor(.white)
                    
                    Text("Score: \(flagPickerViewModel.score)")
                        .font(.title2)
                        .foregroundColor(.white)
                        .bold()
                        .padding()
                    
                } // End of VStack
                
                ForEach(0..<3) { number in
                    Button {
                        self.flagPickerViewModel.submitAnswer(selection: number)
                    } label: {
                        VStack {
                            Image(flagPickerViewModel.countries[number])
                                .renderingMode(.original)
                        }
                    }
                } // End of ForEach
            }
        }
        .alert("You chose the wrong answer. Try again! Your score was \(flagPickerViewModel.score)",isPresented: $flagPickerViewModel.displayWrongAnswerAlert) {
            Button {
                flagPickerViewModel.displayWrongAnswerAlert = false
                flagPickerViewModel.score = 0
                flagPickerViewModel.resetQuestion()
            } label: {
                Text("Ok")
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FlagPicker()
    }
}
