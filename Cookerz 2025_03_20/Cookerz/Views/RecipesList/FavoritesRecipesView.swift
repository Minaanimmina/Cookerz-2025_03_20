//
//  FavoritesRecipesView.swift
//  Cookerz
//
//  Created by Emilie on 12/03/2025.
//

import SwiftUI

struct FavoritesRecipesView: View {
    @EnvironmentObject var baseViewModel: BaseViewModel

    var favoriteRecipes: [Recipe] {
        baseViewModel.user.listRecipes.filter { $0.isLiked }
    }

    var body: some View {
        NavigationStack {
            VStack {
                if favoriteRecipes.isEmpty {
                    Text("Pas de recette dans vos favoris pour le moment")
                        .font(.PoppinsCaption1())
                        .foregroundColor(.mediumGray)
                        .padding()
                    Spacer()
                } else {
                    ScrollView {
                        VStack(spacing: 8) {
                            ForEach(favoriteRecipes) { recipe in
                                NavigationLink(destination: RecipePageView(recipe: recipe)) {
                                    SearchCardRecipeView(recipe: recipe)
                                }
                            }
                        }
                        .padding(.top, 24)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Favoris")
                        .font(.PoppinsTitle3Medium())
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    FavoritesRecipesView()
        .environmentObject(BaseViewModel())
}
