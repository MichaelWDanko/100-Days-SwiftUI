//
//  ContentView.swift
//  WeSplit
//
//  Created by Michael Danko on 6/28/22.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    @State private var name = ""
    
    var body: some View {
        NavigationView {
            Form {
                Button("Tap Me: \(tapCount)") { tapCount += 1 }
                
                TextField("Enter your name", text: $name)
                
                if name != "" {
                    Text("My name is \(name)")
                }
                
            }
            .navigationTitle("We Split App")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
