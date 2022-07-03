//
//  SwiftUIView.swift
//  UnitConversion
//
//  Created by Michael Danko on 7/3/22.
//

import SwiftUI


struct StartView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("What would you like to convert?")
                    .font(.headline)
                    .padding()
                
                NavigationLink("Length", destination: ConversionView(measurement: length))
                .padding()

                NavigationLink("Temperature", destination: ConversionView(measurement: temperature))
                .padding()
                Spacer()
            }
            .navigationTitle("UnitConversion")
            .navigationBarTitleDisplayMode(.automatic)
            
        }
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
