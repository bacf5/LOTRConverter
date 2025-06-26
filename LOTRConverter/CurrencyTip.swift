//
//  CurrencyTip.swift
//  LOTRConverter
//
//  Created by Bruno Agustín Caruso Fassa on 26/06/2025.
//


import TipKit

struct CurrencyTip: Tip {
    var title = Text("Change Currency")
    
    var message: Text? = Text("You can tap the currency to change it")
    
    var image: Image? = Image(systemName: "hand.tap.fill")
    
    
}
