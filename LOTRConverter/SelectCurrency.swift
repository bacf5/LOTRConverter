//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Bruno Agustín Caruso Fassa on 21/06/2025.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @State var topCurrency: Currency
    @State var bottomCurrency: Currency

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
                IconGrid(selectedCurrency: topCurrency)

                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                    .padding(.top)

                // Text

                // Currency icons
                IconGrid(selectedCurrency: bottomCurrency)

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
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    SelectCurrency(topCurrency: .goldPenny, bottomCurrency: .silverPiece)
}
