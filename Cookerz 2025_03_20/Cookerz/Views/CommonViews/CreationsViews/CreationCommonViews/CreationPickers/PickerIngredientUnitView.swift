//
//  PickerIngredientUnitView.swift
//  Cookerz
//
//  Created by apprenant98 on 11/03/2025.
//

import SwiftUI

struct PickerIngredientUnitView: View {
    @Binding var isPickerPresented : Bool
    @Binding var ingredientUnit: IngredientUnit
    
    var body: some View {
        VStack {
            HStack {
                Text ("Unité de mesure")
                    .foregroundStyle(Color.black)
                Spacer()
                Button {
                    isPickerPresented.toggle()
                } label: {
                    Text("Valider")
                        .foregroundStyle(Color.blue)
                }
            }
            .padding()
            .background(Color.grisFond.opacity(0.5))
            .cornerRadius(10)
            
            HStack {
                Spacer()
                Picker("unité ingredient", selection: $ingredientUnit) {
                    ForEach(IngredientUnit.allCases, id: \.self) { unit in
                        HStack {
                            Text(unit.name)
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

//#Preview {
//    RecipeCreationView(newIngredientUnit: .gramme)
//}
