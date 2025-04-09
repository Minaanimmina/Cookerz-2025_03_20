//
//  ProfilPriveMyRecipesView.swift
//  Cookerz
//
//  Created by apprenant87 on 17/03/2025.
//

import SwiftUI

struct ProfilPriveMyRecipesView: View {
    @EnvironmentObject var baseViewModel: BaseViewModel
    
    // colonnes LazyVGrid
    let columns = [
        GridItem(.flexible(), spacing: 4.5),
        GridItem(.flexible(), spacing: 4.5),
        GridItem(.flexible(), spacing: 4.5)
    ]
    
    var body: some View {
        VStack {
            LazyVGrid(columns: columns, spacing: 5) {
                ForEach(baseViewModel.recipeCreatorUser) { recipe in
                    NavigationLink {
                        RecipePageView(recipe: recipe)
                    } label: {
                        Image(recipe.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 111, height: 111)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
            }
        }
        .padding(.horizontal, 24)
    }
}

#Preview {
    ProfilPriveMyRecipesView()
        .environmentObject(BaseViewModel())
}
