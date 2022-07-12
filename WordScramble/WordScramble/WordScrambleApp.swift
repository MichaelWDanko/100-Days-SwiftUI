//
//  WordScrambleApp.swift
//  WordScramble
//
//  Created by Michael Danko on 7/8/22.
//

import SwiftUI

extension Color {
    static let appBlue = Color("appBlue")
    static let appOrange = Color("appOrange")
    static let appPurple = Color("appPurple")
    static let appTextBackground = Color("appTextBackground")
    static let appInvertedText = Color("appInvertedText")
    static let appErrorRed = Color("appErrorRed")
}


@main
struct WordScrambleApp: App {
    var body: some Scene {
        WindowGroup {
            WordScrambleView()
        }
    }
}
