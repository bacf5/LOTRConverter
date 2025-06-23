//
//  IconGrid.swift
//  LOTRConverter
//
//  Created by Bruno Agustín Caruso Fassa on 21/06/2025.
//

import SwiftUI

struct IconGrid: View {
    @State var selectedCurrency: Currency
    
    var body: some View {
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
        
    }
}

    #Preview {
            IconGrid(selectedCurrency: .goldPiece)
        }
