//
//  RecipesListByTypeView.swift
//  Cookerz
//
//  Created by Emilie on 13/03/2025.
//

import SwiftUI

struct RecipesListByTypeView: View {
    @EnvironmentObject var baseViewModel: BaseViewModel
    
    @State var searchText: String = ""
    
    @Binding var selectedRecipeTypes: [RecipeType]
    @Binding var maxDuration: (hours: Int, minutes: Int)?
    @Binding var minDifficulty: Int?
    
    var recipeType: RecipeType

    // Applique les filtres sélectionnés
    var filteredRecipes: [Recipe] {
        baseViewModel.recipesVM.filter { recipe in
            let matchesType = recipe.type.contains(recipeType)
            let matchesSearch = searchText.isEmpty || recipe.title.lowercased().contains(searchText.lowercased())
            let matchesDuration = maxDuration == nil || (recipe.durationHours * 60 + recipe.durationMinutes) <= (maxDuration!.hours * 60 + maxDuration!.minutes)
            let matchesDifficulty = minDifficulty == nil || {
                switch minDifficulty {
                case 1: return recipe.level == .easy || recipe.level == .medium || recipe.level == .hard
                case 2: return recipe.level == .medium || recipe.level == .hard
                case 3: return recipe.level == .hard
                default: return true
                }
            }()

            return matchesType && matchesSearch && matchesDuration && matchesDifficulty
        }
    }

    var body: some View {
        
        NavigationStack {
            SearchBarRecipesView(searchText: $searchText,
                                 selectedRecipeTypes: $selectedRecipeTypes,
                                 maxDuration: $maxDuration,
                                 minDifficulty: $minDifficulty)
                .padding(.bottom, 8)
                .padding(.top, 16)
            
            ScrollView {
                VStack(spacing: 8) {
                    ForEach(filteredRecipes) { recipe in
                        NavigationLink(destination: RecipePageView(recipe: recipe)) {
                            SearchCardRecipeView(recipe: recipe)
                        }
                    }
                }
                .padding(.vertical, 8)
            }
            .navigationTitle(recipeType.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NavigationStack {
        RecipesListByTypeView(
            selectedRecipeTypes: .constant([]),
            maxDuration: .constant(nil),
            minDifficulty: .constant(nil),
            recipeType: .vegan
        )
        .environmentObject(BaseViewModel())
    }
}
