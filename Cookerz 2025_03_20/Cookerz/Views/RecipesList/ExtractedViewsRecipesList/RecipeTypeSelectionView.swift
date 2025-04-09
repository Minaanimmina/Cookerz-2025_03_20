//
//  RecipeTypeSelectionView.swift
//  Cookerz
//
//  Created by Emilie on 14/03/2025.
//

import SwiftUI

struct RecipeTypeSelectionView: View {
    
    @Binding var selectedRecipeTypes: [RecipeType]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Type")
                .font(.PoppinsBodyMedium())
                .foregroundStyle(.mediumGray)
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 0), count: 3), spacing: 20) {
                
                ForEach(RecipeType.allCases, id: \.self) { type in
                    Button {
                        if selectedRecipeTypes.contains(type) {
                            selectedRecipeTypes.removeAll { $0 == type }  // Si déjà sélectionné on retire
                        } else {
                            selectedRecipeTypes.append(type)  // Sinon on l'ajoute
                        }
                    } label: {
                        VStack {
                            Image(type.icon)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 55, height: 55)
                                .padding(5)
                                .background(selectedRecipeTypes.contains(type) ? Color.red50 : Color.clear)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(selectedRecipeTypes.contains(type) ? Color.red50 : Color.grisBordure, lineWidth: 2)
                                )
                            Text(type.name)
                                .font(.PoppinsFootnote())
                                .foregroundColor(.black)
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 24)
    }
}

#Preview {
    RecipeTypeSelectionView(selectedRecipeTypes: .constant([]))
}
