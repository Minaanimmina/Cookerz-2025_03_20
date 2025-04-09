//
//  PageStuffView.swift
//  Cookerz
//
//  Created by apprenant98 on 13/03/2025.
//

import SwiftUI

struct PageStuffView: View {
    @Binding var numberPortionChosen : Int
    var numberPortionBase : Int
    var listIngredients : [Ingredient]
    var listUstensils : [Ustensil]
    
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Text("Ingrédients")
                Spacer()
                PortionsView(numberPortionChosen: $numberPortionChosen)
            }
            
            PageListIngredientsView(listIngredient: listIngredients , portion: numberPortionBase, numberPortionChosen: $numberPortionChosen )
            
            VStack {
                Text("Ustensiles")
            }
            .padding(.top)
            
            
            ListUstensilsView(listUstensils: listUstensils)
        }
        .font(.PoppinsTitle3Medium())
    }
}


#Preview {
    RecipePageView(recipe : recipes[0])
}


