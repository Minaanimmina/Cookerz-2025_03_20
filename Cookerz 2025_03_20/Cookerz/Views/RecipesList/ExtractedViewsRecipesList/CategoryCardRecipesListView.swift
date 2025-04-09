//
//  CategoryCardRecipesListView.swift
//  Cookerz
//
//  Created by Emilie on 11/03/2025.
//

import SwiftUI

struct CategoryCardRecipesListView: View {
    @EnvironmentObject var baseViewModel: BaseViewModel

    var recipeType: RecipeType

    @Binding var selectedRecipeTypes: [RecipeType]
    @Binding var maxDuration: (hours: Int, minutes: Int)?
    @Binding var minDifficulty: Int?
       
   //  Applique les filtres sélectionnés
   var filteredRecipes: [Recipe] {
       baseViewModel.recipesVM.filter { recipe in
           let matchesType = recipe.type.contains(recipeType)
           let matchesDuration = maxDuration == nil || (recipe.durationHours * 60 + recipe.durationMinutes) <= (maxDuration!.hours * 60 + maxDuration!.minutes)
           let matchesDifficulty = minDifficulty == nil || {
               switch minDifficulty {
               case 1: return recipe.level == .easy || recipe.level == .medium || recipe.level == .hard
               case 2: return recipe.level == .medium || recipe.level == .hard
               case 3: return recipe.level == .hard
               default: return true
               }
           }()

           return matchesType && matchesDuration && matchesDifficulty
       }
   }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack {
                Text(recipeType.name)
                    .font(.PoppinsTitle3Medium())
                    .padding(.leading, 24)
                Spacer()
                NavigationLink(destination:
                    RecipesListByTypeView(selectedRecipeTypes: $selectedRecipeTypes,
                                          maxDuration: $maxDuration,
                                          minDifficulty: $minDifficulty,
                                          recipeType: recipeType)) {
                    Text("Voir tout")
                        .font(.PoppinsFootnoteLight())
                        .foregroundStyle(.black)
                        .padding(.trailing, 24)
                }
            }
            .padding(.bottom, 2)
            
            ScrollView(.horizontal) {
                HStack(spacing: 16) {
                    ForEach(filteredRecipes) { recipe in
                        NavigationLink(destination: RecipePageView(recipe: recipe)) {
                            RecipeCardView(recipe: recipe)
                        }
                    }
                }.padding(.leading, 24)
            }
        }
        .padding(.bottom, 12)
    }
}

#Preview {
    CategoryCardRecipesListView(
        recipeType: .vegan,
        selectedRecipeTypes: .constant([]),
        maxDuration: .constant(nil),
        minDifficulty: .constant(nil)
    )
    .environmentObject(BaseViewModel())
}
