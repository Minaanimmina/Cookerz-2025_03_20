//
//  AtelierDoublePicker.swift
//  Cookerz
//
//  Created by apprenant98 on 14/03/2025.
//

import SwiftUI

struct AtelierDoublePickerView: View {
    @Binding var selectedPart: AtelierEnum
    var body: some View {
        Picker("Catégorie", selection: $selectedPart) {
            Text(AtelierEnum.description.name).tag(AtelierEnum.description)
            Text(AtelierEnum.ingredients.name).tag(AtelierEnum.ingredients)
        }
        .pickerStyle(.segmented)
        .padding(.vertical)
        .colorScheme(.light)
    }
}
