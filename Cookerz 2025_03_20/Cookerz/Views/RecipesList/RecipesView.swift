//
//  RecipesView.swift
//  Cookerz
//
//  Created by Emilie on 10/03/2025.
//
import SwiftUI

struct RecipesView: View {
    
    @EnvironmentObject var baseViewModel: BaseViewModel
    
    @State var searchText: String = ""
    
    var isSearching: Bool {
        !searchText.isEmpty
    }
    
    @State var selectedRecipeTypes: [RecipeType] = []
    @State var maxDuration: (hours: Int, minutes: Int)? = nil
    @State var minDifficulty: Int? = nil
    
    var filteredRecipes: [Recipe] {
        baseViewModel.recipesVM.filter { recipe in
            let matchesSearch = searchText.isEmpty || recipe.title.lowercased().contains(searchText.lowercased())
            let matchesType = selectedRecipeTypes.isEmpty || selectedRecipeTypes.contains(recipe.type)
            let matchesDuration = maxDuration == nil || (recipe.durationHours * 60 + recipe.durationMinutes) <= (maxDuration!.hours * 60 + maxDuration!.minutes)
            let matchesDifficulty = minDifficulty == nil || {
                switch minDifficulty {
                case 1: return recipe.level == .easy || recipe.level == .medium || recipe.level == .hard
                case 2: return recipe.level == .medium || recipe.level == .hard
                case 3: return recipe.level == .hard
                default: return true
                }
            }()
            return matchesSearch && matchesType && matchesDuration && matchesDifficulty
        }
    }
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                SearchBarRecipesView(searchText: $searchText,
                                     selectedRecipeTypes: $selectedRecipeTypes,
                                     maxDuration: $maxDuration,
                                     minDifficulty: $minDifficulty)
                    .padding(.top, 16)
                    .padding(.bottom, 16)
                
                // Bouton Réinitialiser les filtres
                if !selectedRecipeTypes.isEmpty || maxDuration != nil || minDifficulty != nil {
                    HStack {
                        Spacer()
                        Button("Réinitialiser les filtres") {
                            selectedRecipeTypes.removeAll()
                            maxDuration = nil
                            minDifficulty = nil
                        }
                        .font(.PoppinsSubhead())
                        .foregroundColor(.red400)
                        .padding(.trailing, 24)
                    }
                    .padding(.bottom, 8)
                }
                
                if isSearching || !selectedRecipeTypes.isEmpty || maxDuration != nil || minDifficulty != nil {
                    ScrollView {
                        VStack(spacing: 8) {
                            ForEach(filteredRecipes) { recipe in
                                NavigationLink(destination: RecipePageView(recipe: recipe)) {
                                    SearchCardRecipeView(recipe: recipe)
                                }
                            }
                        }
                    }
                } else {
                    ScrollView {
                        ForEach(RecipeType.allCases, id: \.self) { recipeType in
                            CategoryCardRecipesListView(recipeType: recipeType, selectedRecipeTypes: $selectedRecipeTypes,
                                maxDuration: $maxDuration,
                                minDifficulty: $minDifficulty)
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink(destination: RecipeCreationView()) {
                        Image(systemName: "plus.circle")
                            .padding(.leading, 8)
                            .font(.system(size: 24))
                            .frame(width: 44, height: 44)
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("Recettes")
                        .font(.PoppinsTitle3Medium())
                }
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: FavoritesRecipesView()) {
                        Image(systemName: "heart")
                            .padding(.trailing, 8)
                            .font(.system(size: 24))
                            .frame(width: 44, height: 44)
                    }
                    
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    RecipesView()
        .environmentObject(BaseViewModel())
      
}
