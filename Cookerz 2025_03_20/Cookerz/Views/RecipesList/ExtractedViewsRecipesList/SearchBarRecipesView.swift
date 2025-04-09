//
//  SearchRecipesView.swift
//  Cookerz
//
//  Created by Emilie on 11/03/2025.
//

import SwiftUI

struct SearchBarRecipesView: View {
    
    @Binding var searchText: String
    
    @FocusState var isFocused: Bool // Gère le focus
    
    @State private var showFilterView = false // Gère l'affichage de FilterRecipesView
    
    @Binding var selectedRecipeTypes: [RecipeType]
    @Binding var maxDuration: (hours: Int, minutes: Int)?
    @Binding var minDifficulty: Int?

    var body: some View {
        HStack {
            Spacer()
            HStack {
                Image("search")
                    .foregroundColor(.black)

                TextField("Ingrédients, recettes...", text: $searchText)
                    .textFieldStyle(PlainTextFieldStyle())
                    .focused($isFocused) // Met automatiquement isFocused à true
                    .submitLabel(.search) //  Le clavier affiche un bouton “Rechercher” au lieu de "Retour"
                
                // Icône pour vider le texte dans la SearchBar
                if !searchText.isEmpty {
                    Button {
                        searchText = ""
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.black.opacity(0.7))
                    }
                }
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 8)
            .frame(width: isFocused ? 240 : 300)
            .background(Color.grisFond)
            .clipShape(RoundedRectangle(cornerRadius: 12))
          
            // Bouton pour ouvrir FilterRecipesView
            Button {
                showFilterView = true // Ouvre FilterRecipesView
            } label: {
                Image("filter")
                    .foregroundColor(.black)
                    .frame(width: 40, height: 40)
                    .background(Color.grisFond)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            // Affiche FilterRecipesView en modal
            .sheet(isPresented: $showFilterView) {
                FilterRecipesView(selectedRecipeTypes: $selectedRecipeTypes,
                                  maxDuration: $maxDuration,
                                  minDifficulty: $minDifficulty)
                }
            Spacer()

            ZStack {
                if isFocused {
                    Button("Annuler") {
                        searchText = "" // Efface le texte
                        isFocused = false // Perd le focus et le clavier disparaît
                    }
                    .foregroundColor(.red400)
                    .font(.PoppinsSubhead())
                    .transition(.move(edge: .trailing).combined(with: .opacity)) // Effet transition
                }
            }
            .frame(width: isFocused ? 60 : 0)
        }
        .padding(.horizontal, 24)
    }
}

#Preview {
    SearchBarRecipesView(
        searchText: .constant(""),
        selectedRecipeTypes: .constant([]),
        maxDuration: .constant(nil),
        minDifficulty: .constant(nil)
    )
}
