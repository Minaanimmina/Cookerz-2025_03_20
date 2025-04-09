//
//  CreationListIngredientsView.swift
//  Cookerz
//
//  Created by apprenant98 on 14/03/2025.
//


import SwiftUI

struct CreationListIngredientsView: View {
    @Binding var listIngredients: [Ingredient]
    
    func formatNumber(_ number: Double) -> String {
        let formattedNumber = String(format: "%.2f", number)
        
        if formattedNumber.hasSuffix(".00") {
            return String(formattedNumber.prefix { $0 != "." })
        } else {
            return formattedNumber
        }
    }
    
    var body: some View {
        ForEach(listIngredients, id: \.self) { ingredient in
            HStack {
                Image(ingredient.type.Icon)
                    .resizable()
                    .frame(width: 24, height: 24)
                
                Text(ingredient.name.capitalized)
                    .font(.body)
                
                Spacer()
                
                if let quantity = ingredient.quantity, let unit = ingredient.unit {
                    let formattedQuantity = formatNumber(quantity)
                    Text("\(formattedQuantity) \(unit.initial)")
                }
                
                Button {
                    // Remove the ingredient from the list
                    if let index = listIngredients.firstIndex(where: { $0.id == ingredient.id }) {
                        listIngredients.remove(at: index)
                        
                    }
                } label: {
                    ButtonPortionView(textSymbol: "x")
                }
            }
            .padding(.horizontal, 8)
        }
    }
}

#Preview {
    RecipeCreationView()
}
