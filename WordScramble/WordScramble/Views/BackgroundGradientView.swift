//
//  BackgroundGradientView.swift
//  WordScramble
//
//  Created by Michael Danko on 7/16/22.
//

import SwiftUI

struct BackgroundGradientView: View {
    var body: some View {
        LinearGradient(colors: [.appOrange, .appPurple, .appBlue],
                       startPoint: .topTrailing,
                       endPoint: .bottomTrailing)
            .ignoresSafeArea()
            .opacity(0.80)
    }
}

struct BackgroundGradientView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundGradientView()
    }
}
