//
//  RecipeDoublePicker.swift
//  Cookerz
//
//  Created by apprenant98 on 14/03/2025.
//

import SwiftUI

struct RecipeDoublePickerView: View {
    @Binding var selectedPart : RecipeEnum
    var body: some View {
        Picker("Catégorie", selection: $selectedPart) {
            Text(RecipeEnum.ingredients.name).tag(RecipeEnum.ingredients)
            Text(RecipeEnum.instructions.name).tag(RecipeEnum.instructions)
        }
        .pickerStyle(.segmented)
        .padding(.vertical)
        .colorScheme(.light)
        
    }
}

#Preview {
    RecipePageView(recipe : recipes[15])
}
