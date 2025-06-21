//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Bruno Agustín Caruso Fassa on 17/06/2025.
//

import SwiftUI

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var leftAmount = ""
    @State var rightAmount = ""
    
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
                        }.padding(.bottom, -5)
                        // Text field
                        TextField("Amount", text: $leftAmount).textFieldStyle(.roundedBorder)
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
                        }.padding(.bottom, -5)
                        // Text field
                        TextField("Amount", text: $rightAmount).textFieldStyle(.roundedBorder).multilineTextAlignment(.trailing)
                    }
                }.padding().background(.black.opacity(0.5))
                // i didn´t like it with the clipShape style
                // .clipShape(.capsule)
                
                Spacer()
                HStack{
                    Spacer()
                    // info Button
                    Button {
                        showExchangeInfo.toggle()
                        //                        print("showExchangeInfo value: \(showExchangeInfo)")
                        
                    } label: {
                        Image(systemName: "info.circle.fill").font(.largeTitle).foregroundStyle(.white)
                    }
                }.padding(.trailing).sheet(isPresented: $showExchangeInfo){
                    ExchangeInfo()
                }
            }
//            .border(.blue)
        }
    }
}

#Preview {
    ContentView()
}
