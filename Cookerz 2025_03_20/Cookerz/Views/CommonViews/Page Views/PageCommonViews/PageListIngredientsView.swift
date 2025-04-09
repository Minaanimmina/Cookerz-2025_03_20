//
//  PageListIngredientsView.swift
//  Cookerz
//
//  Created by apprenant98 on 11/03/2025.
//

import SwiftUI

struct PageListIngredientsView: View {
    var listIngredient: [Ingredient]
    var portion : Int
    @Binding var numberPortionChosen : Int
    
    func formatNumber(_ number: Double) -> String {
      
        let formattedNumber = String(format: "%.2f", number)
        
     
        if formattedNumber.hasSuffix(".00") {
            return String(formattedNumber.prefix { $0 != "." })
        } else {
            return formattedNumber
        }
    }
    
    func calculateAdjustedQuantity(for ingredient: Ingredient) -> String {
        if let quantity = ingredient.quantity, let unit = ingredient.unit {
            let adjustedQuantity = quantity * Double(numberPortionChosen) / Double(portion)
            let formattedQuantity = formatNumber(adjustedQuantity)
            return "\(formattedQuantity) \(unit.initial)"
        }
        return ""
    }
    
    var body: some View {
        ForEach(listIngredient) { ingredient in
            HStack {
                Image(ingredient.type.Icon)
                    .resizable()
                    .frame(width: 24, height: 24)
                
                Text(ingredient.name.capitalized)
                    .font(.PoppinsCallout())
                
                Spacer()
                
                Text(calculateAdjustedQuantity(for: ingredient))
                    .font(.PoppinsSubhead())
                    .foregroundStyle(.black.opacity(0.7))
            }
        }
    }
}


#Preview {
    //    PageHeaderView(elementTitle: recipes[0].title, recipeCreator: users[0])
    RecipePageView (recipe : recipes[0])
}
