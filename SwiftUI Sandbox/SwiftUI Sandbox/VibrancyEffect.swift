//
//  VibrancyEffect.swift
//
//
//  Created by Michael Danko on 7/3/22.
//

import SwiftUI

struct VibrancyEffect: View {
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Color.red
                Color.blue
            }

            Text("Your content")
                .foregroundColor(.secondary)
//                .foregroundStyle(.secondary)
                .padding(50)
                .background(.ultraThinMaterial)
        }
        .ignoresSafeArea()
    }
}

struct VibrancyEffect_Previews: PreviewProvider {
    static var previews: some View {
        VibrancyEffect()
    }
}
