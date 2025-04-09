//
//  PageTransparentFrontBGImage.swift
//  Cookerz
//
//  Created by apprenant98 on 14/03/2025.
//

import SwiftUI

struct RecipePageTransparentFrontBGImage: View {
    var recipe : Recipe
    @EnvironmentObject var baseViewModel: BaseViewModel
    var isFavorite: Bool {
        if let index = baseViewModel.user.listRecipes.firstIndex(where: { $0.id == recipe.id}) {
            return baseViewModel.user.listRecipes[index].isLiked
        } else {
            return false
        }
    }
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.clear)
                .frame(width: UIScreen.main.bounds.width, height: 20)
            HStack {
                PageNCreationReturnedButton()
                
                Spacer()
                Button {
                    baseViewModel.toggleFavoriteRecipe(recipe: recipe)
                } label : {
                    HStack {
                        if isFavorite {
                            Image("fav_fill")
                                .foregroundStyle(.black)
                        }else {
                            Image("fav")
                                .foregroundStyle(.black)
                        }
                    }
                    .padding()
                    .background(Color.white.opacity(0.75))
                    .cornerRadius(100)
                }
                
            }
            .padding(.horizontal)
            .padding(.trailing)
            
            Rectangle()
                .fill(Color.clear)
                .frame(width: UIScreen.main.bounds.width, height: 120)
        }
        .padding(.top, 34)
    }
}

#Preview {
    RecipePageView (recipe : recipes[0])
        .environmentObject(BaseViewModel())
}



struct PageNCreationReturnedButton: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        }label : {
            HStack {
                Text("< Retour")
            }
            .padding()
            .background(Color.white.opacity(0.75))
            .foregroundColor(.black)
            .cornerRadius(50)
        }
    }
}
