//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Bruno Agustín Caruso Fassa on 21/06/2025.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @State var selectedCurrency: Currency

    var body: some View {
        ZStack {
            // Parchment bg image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)

            VStack {
                // Text
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)

                // Currency icons
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                    ForEach(Currency.allCases) { currency in
                        if selectedCurrency == currency {
                            CurrencyIcon(
                                currencyImage: currency.image,
                                currencyName: "\(currency.name)"
                            )
                            .shadow(color: .black, radius: 10)
                            .overlay {
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(lineWidth: 2)
                                    .opacity(0.4)
                            }
                        } else {
                            CurrencyIcon(
                                currencyImage: currency.image,
                                currencyName: "\(currency.name)"
                            ).onTapGesture {
                                selectedCurrency = currency
                            }
                        }
                    }
                }

                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)

                // Text

                // Currency icons

                // Done button
                Button("Done") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)

            }
            .padding()
            .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    SelectCurrency(selectedCurrency: .goldPiece)
}
