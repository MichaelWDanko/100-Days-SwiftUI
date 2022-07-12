//
//  InstructionsView.swift
//  WordScramble
//
//  Created by Michael Danko on 7/11/22.
//

import SwiftUI

struct InstructionsView: View {
    
    var instructionText: String = """
    This is how you play. Enter a word if you can spell it using the letters of the selected base word.
    
    You will get points based upon the length of the word you spell.
    """
    
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.appOrange, .appPurple, .appBlue],
                           startPoint: .topTrailing,
                           endPoint: .bottomTrailing)
                .ignoresSafeArea()
                .opacity(1.0)
            Color.white
//                .opacity(0.30)
                .background(.ultraThinMaterial)
                .opacity(0.20)
                .ignoresSafeArea()
//            RoundedRectangle(cornerRadius: 20)
//                .frame(width: 300, height: 400)
            VStack {
                Text(String("Instructions").uppercased())
                    .font(.title)
                    .padding(.bottom)
                Text(instructionText)
                Button(role: .cancel) {
                    print("Confirm button pressed")
                } label: {
                    Text("Confirm")
                }

            }
            .padding()
            .background(.regularMaterial)
            .cornerRadius(30)
            
        }
    }
}

struct InstructionsView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionsView()
    }
}
