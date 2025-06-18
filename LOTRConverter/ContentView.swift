//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Bruno Agustín Caruso Fassa on 17/06/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            // Background image
            Image(.background).resizable().ignoresSafeArea()
            
            VStack {
                // Prancing pony image
                
                Image(.prancingpony).resizable().scaledToFit().frame(height: 200)
                
                // Currency exchange text
                
                Text("Currency Exchange").font(.largeTitle).foregroundStyle(.white)
                
                // Conversion section
                HStack {
                    // Left conversion section
                    VStack {
                         // Currency
                    
                        HStack {
                            // currency image
                            Image(.silverpiece).resizable().scaledToFit().frame(height: 33)
                            
                            // currency text
                            Text("Silver Piece").font(.headline).foregroundStyle(.white)
                        }
                        // Text field
                        Text("Text field")
                    }
                    // Equal sign
                    Image(systemName: "equal").font(.largeTitle).foregroundStyle(.white).symbolEffect(.pulse)
                    
                    // Right conversion section
                    VStack {
                        // Currency
                        HStack {
                            // currency text
                            Text("Gold Piece").font(.headline).foregroundStyle(.white)
                            // currency image
                            Image(.goldpiece).resizable().scaledToFit().frame(height: 33)
                        }
                        // Text field
                    Text("Text field")
                    }
                }
                
                Spacer()
                
                // info Button
                Image(systemName: "info.circle.fill").font(.largeTitle).foregroundStyle(.white)
            }
//            .border(.blue)
        }
    }
}

#Preview {
    ContentView()
}
