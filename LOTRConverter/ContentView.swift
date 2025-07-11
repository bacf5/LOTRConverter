//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Bruno Agustín Caruso Fassa on 17/06/2025.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var showSelectCurrency = false
    
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    
    let currencyTip = CurrencyTip()
    
    var body: some View {
        ZStack {
            // Background image
            Image(.background).resizable().ignoresSafeArea()
            
            VStack {
                // Prancing pony image
                
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                // Currency exchange text
                
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                // Conversion section
                HStack {
                    // Left conversion section
                    VStack {
                        // Currency
                        
                        HStack {
                            // currency image
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            // currency text
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                            currencyTip.invalidate(reason: .actionPerformed)
                        }
                        .popoverTip(currencyTip, arrowEdge: .bottom)
                        
                            
                        // Text field
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftTyping)
                            .onChange(of: leftAmount) {
                                if leftTyping {
                                    rightAmount = leftCurrency
                                        .convert(leftAmount, to: rightCurrency)
                                }}
                            .onChange(of: leftCurrency) {
                                leftAmount = rightCurrency
                                    .convert(rightAmount, to: leftCurrency)

                            }
                    }
                    // Equal sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    // Right conversion section
                    VStack {
                        // Currency
                        HStack {
                            // currency text
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            // currency image
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }.padding(.bottom, -5)
                            .onTapGesture {
                                showSelectCurrency.toggle()
                                currencyTip.invalidate(reason: .actionPerformed)
                            }
                        
                        
                        // Text field
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .focused($rightTyping)
                            .onChange(of: rightAmount){
                                if rightTyping {
                                    leftAmount = rightCurrency
                                        .convert(rightAmount, to: leftCurrency)
                                }}
                            .onChange(of: rightCurrency) {
                                rightAmount = leftCurrency
                                    .convert(leftAmount, to: rightCurrency)
                            }
                    }
                }.padding().background(.black.opacity(0.5))
                    .keyboardType(.decimalPad)
                    
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
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                }.padding(.trailing).sheet(isPresented: $showExchangeInfo){
                    ExchangeInfo()
                }
                .sheet(isPresented: $showSelectCurrency) {
                    SelectCurrency(
                        topCurrency: $leftCurrency,
                        bottomCurrency: $rightCurrency
                    )
                }
                .task {
                    try? Tips.configure()
                }
            }
            //            .border(.blue)
        }
    }
}

#Preview {
    ContentView()
}

