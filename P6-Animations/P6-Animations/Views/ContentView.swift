//
//  ContentView.swift
//  P6-Animations
//
//  Created by Michael Danko on 7/16/22.
//

import SwiftUI



struct ContentView: View {
    
    @State private var animationAmount = 1.0
    
    var body: some View {
        VStack {
            Button {
                self.animationAmount += 0.5
            } label: {
                Text("Tap Me")
            }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
            
            .animation(.default, value: animationAmount)
            .blur(radius: (animationAmount - 1) * 3)

        } // End of VStack
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
