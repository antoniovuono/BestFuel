//
//  ContentView.swift
//  BestFuel
//
//  Created by Antonio Vuono on 08/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var gasolinePrice: Double? = nil
    @State private var avarageConsumptionGasoline: Double? = nil
    @State private var alcoholPrice: Double? = nil
    @State private var avarageConsumptionAlcohol: Double? = nil

    var gasolinePricePerLiter: String {
        let pricePerLiter = Double(gasolinePrice ?? 0) / Double(avarageConsumptionGasoline ?? 0)
        let pricePerLiterFixed = String(pricePerLiter.formatted(.number.precision(.fractionLength(2))))
        
        
        if gasolinePrice == nil || avarageConsumptionGasoline == nil {
            return "Gasoline:"
        }
        
        return "Gasoline: \(pricePerLiterFixed) per liter of gasoline"
    }
    
    var alcoholPricePerLiter: String {
        let pricePerLiter = Double(alcoholPrice ?? 0) / Double(avarageConsumptionAlcohol ?? 0)
        let pricePerLiterFixed = String(pricePerLiter.formatted(.number.precision(.fractionLength(2))))
        
        if alcoholPrice == nil || avarageConsumptionAlcohol == nil {
            return "Alcohol:"
        }
        
        return "Alcohol: \(pricePerLiterFixed) per liter of alcohol"
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("gasoline") {
                    TextField("price", value: $gasolinePrice, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                    
                    TextField("avarage consumption", value: $avarageConsumptionGasoline, format: .number)
                }
                
                Section("alcohol") {
                    TextField("price", value: $alcoholPrice, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    TextField("avarage consumption", value: $avarageConsumptionAlcohol, format: .number)
                }
                
                Section ("results") {
                    Text(gasolinePricePerLiter)
                    Text(alcoholPricePerLiter)
                }
            }
            .navigationTitle("Best Fuel")
        }
    }
}

#Preview {
    ContentView()
}
