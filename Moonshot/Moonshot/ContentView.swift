//
//  ContentView.swift
//  Moonshot
//
//  Created by Michael Danko on 10/5/24.
//

import SwiftUI

struct CustomView: View {
    
    let text: String
    
    var body: some View {
        Text("\(text)")
    }
    
    init(text: String) {
        print("Creating a new CustomText: \(text)")
        self.text = text
    }
}

//struct ScrollDetails: View {
//    var body: some View {
//        ScrollView() {
//            LazyVStack(spacing: 10) {
//                ForEach(0..<100) {
//                    CustomView(text: "Item \($0)")
//                        .font(.title)
//                }
//            }
//            .frame(maxWidth: .infinity)
//        }
//        
//    }
//}

struct Address: Codable {
    let street: String
    let city: String
    let state: String
}

struct User: Codable {
    let name: String
    let address: Address
}

let layoutColumns = [
    GridItem(.fixed(80)),
    GridItem(.fixed(80)),
    GridItem(.fixed(80))
]

struct SquareView: View {
    let contentText: String
    var body: some View {
        ZStack {
            Color.blue
            Text("\(contentText)")
                .foregroundStyle(.white)
        }
        .frame(height: 50)
        .cornerRadius(10)
    }
}

let layoutAdaptiveColumns = [
        GridItem(.adaptive(minimum: 90, maximum: 90))
    ]

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ScrollView(.vertical){
                LazyVGrid(columns: layoutAdaptiveColumns) {
                    ForEach(0..<100) {
                        SquareView(contentText: "Item \($0)")
                    }
                }
            }
            .navigationTitle("Moonshot")
        } // End of NavigationStack
    }
}

#Preview {
    ContentView()
}
