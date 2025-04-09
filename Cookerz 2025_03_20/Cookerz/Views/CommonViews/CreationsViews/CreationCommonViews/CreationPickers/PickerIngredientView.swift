//
//  PickerIngredientView.swift
//  Cookerz
//
//  Created by apprenant98 on 12/03/2025.
//

import SwiftUI

struct PickerIngredientView: View {
    @Binding var isPickerPresented : Bool
    @Binding var ingredientChosen : Bool
    
    @Binding var ingredient : Ingredient
    @State var ingredientType : IngredientType = .fruit
    
    var body: some View {
        VStack {
            HStack {
                Text ("Choix d'ingrédient")
                    .foregroundStyle(Color.black)
                Spacer()
                Button {
                    ingredientChosen = true
                    isPickerPresented = false
                } label: {
                    Text("Valider")
                        .foregroundStyle(Color.blue)
                }
            }
            .padding()
            .background(Color.grisFond.opacity(0.5))
            .cornerRadius(10)
            
            HStack {
                
                Picker("Type d'ingredient", selection: $ingredientType) {
                    ForEach(IngredientType.allCases, id: \.self) { ingredient in
                        HStack {
                            Image(ingredient.Icon)
                                .resizable()
                                .frame(width: 25, height: 25)
                            Text(ingredient.name)
                        }
                    }
                }
                .pickerStyle(.wheel)
                
                Spacer()
                
                Picker("Choix d'ingrédient", selection: $ingredient) {
                    ForEach(ingredientsBase.filter { $0.type == ingredientType }, id: \.self) { ingredient in
                        HStack {
                            Text(ingredient.name)
                                .font(.PoppinsCaption2Medium())
                        }
                    }
                }
                .pickerStyle(.wheel)
            }
        }
        .padding(.horizontal, 25)
        .frame(maxHeight: 250)
        .background(Color.white)
    }
}

#Preview {
    RecipeCreationView()
}

