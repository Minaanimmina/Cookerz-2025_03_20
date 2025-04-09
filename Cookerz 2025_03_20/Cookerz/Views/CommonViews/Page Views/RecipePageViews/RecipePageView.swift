//
//  RecipePageView.swift
//  Cookerz
//
//  Created by apprenant98 on 10/03/2025.
//

import SwiftUI

struct RecipePageView: View {

    @State var recipe: Recipe
    var recipeCreatorId: UUID { recipe.creatorId }
    var recipeCreator: User? {
        for user in users {
            if user.id == recipeCreatorId {
                return user
            }
        }
        return nil
    }
    
    @State var selectedPart: RecipeEnum = .ingredients
    @State var numberPortionChosen: Int = 1
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            ScrollView {
                ZStack(alignment: .top) {
                    BackgroungImage(imageName: recipe.image)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        RecipePageTransparentFrontBGImage(recipe: recipe)
                        
                        
                        VStack {
                            PageHeaderView(elementTitle: recipe.title, recipeCreator: recipeCreator)
                            VStack (spacing : 8) {
                                HStack(spacing: 8) {
                                    RecipePageTimeView(recipe: recipe)
                                    PageGeneralInfosView(GeneralInfoIcon: recipe.level.IconBlackWhite, GeneralInfoText: recipe.level.name)
                                    PageGeneralInfosView(GeneralInfoIcon: "fav", GeneralInfoText: "\(recipe.likes)")
                                }
                                
                                RecipeDoublePickerView(selectedPart: $selectedPart)
                                
                      
                                if selectedPart == .ingredients {
                                    PageStuffView( numberPortionChosen: $numberPortionChosen, numberPortionBase: recipe.portion, listIngredients : recipe.ingredients,
                                                   listUstensils : recipe.ustensils)
                                }
                                else {
                                    RecipePageListSteps(listSteps : recipe.steps)
                                }
                    
                            }
                        }
                        .padding(20)
                        .padding(.bottom, 20)
                        .background(Color.white)
                        .cornerRadius(20)
                    }
                }
                .padding(.top, 8)
                
            }

                        
        }
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()

        .onAppear {
            numberPortionChosen = recipe.portion
        }
    }
}


#Preview {
    RecipePageView(recipe : recipes[1])
        .environmentObject(BaseViewModel())
}


struct BackgroungImage: View {
    var imageName : String
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .frame(width: UIScreen.main.bounds.width, height: 250)
            .ignoresSafeArea(edges : .top)
    }
}





