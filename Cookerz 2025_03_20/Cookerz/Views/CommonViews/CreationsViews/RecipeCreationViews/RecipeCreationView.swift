//
//  RecipeCreationView.swift
//  Cookerz
//
//  Created by apprenant98 on 14/03/2025.
//


import SwiftUI

struct RecipeCreationView: View {
    @Environment(\.presentationMode) private var presentationMode
    
    @EnvironmentObject var baseViewModel : BaseViewModel
    
    @State private var isTimePickerPresented = false
    @State private var isIngredientPickerPresented = false
    @State private var isIngredientUnitPickerPresented = false
    @State private var isUstensilTypePickerPresented = false
    
    @State private var ingredientChosen: Bool = false
    @State private var ustensilChosen: Bool = false
    
    @State var isGalleryPresented = false
    
    
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.white.ignoresSafeArea()
            
            ScrollView {
                ZStack(alignment: .top) {
                    CreationImageView(isDateTimePickerPresented: $isTimePickerPresented, isIngredientPickerPresented: $isIngredientPickerPresented, isIngredientUnitPickerPresented: $isIngredientUnitPickerPresented, isUstensilTypePickerPresented: $isUstensilTypePickerPresented, isGalleryPresented: $isGalleryPresented, elementImage: $baseViewModel.recipeImage)
             
                    VStack {
                        VStack(alignment: .leading, spacing: 10) {
                            Rectangle()
                                .fill(Color.clear)
                                .frame(width: UIScreen.main.bounds.width, height: 20)
                            HStack {
                                PageNCreationReturnedButton()
                            }
                            .padding(.horizontal)
                            Rectangle()
                                .fill(Color.clear)
                                .frame(width: UIScreen.main.bounds.width, height: 120)
                        }
                        .padding(.horizontal, 20)
                        VStack(spacing: 8) {
                            HStack {
                                TextField("Nom de la recette", text: $baseViewModel.recipeTitle)
                                    .font(.PoppinsTitle3Medium())
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .padding(.top, 20)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 16) {
                                    ForEach(RecipeType.allCases, id: \.self) { type in
                                        Button {
                                                if baseViewModel.selectedRecipeTypes.contains(type) {
                                                    baseViewModel.selectedRecipeTypes.removeAll { $0 == type }  // Si déjà sélectionné on retire
                                                } else {
                                                    baseViewModel.selectedRecipeTypes.append(type)  // Sinon on l'ajoute
                                                }
                                            
                                                                }  label: {
                                            VStack {
                                                Image(type.icon)
                                                                            .resizable()
                                                                            .scaledToFit()
                                                                            .frame(width: 55, height: 55)
                                                                            .padding(5)
                                                                            .background(baseViewModel.selectedRecipeTypes.contains(type) ? Color.red50 : Color.clear)
                                                                            .clipShape(RoundedRectangle(cornerRadius: 12))
                                                                            .overlay(
                                                                                RoundedRectangle(cornerRadius: 12)
                                                                                    .stroke(baseViewModel.selectedRecipeTypes.contains(type) ? Color.red50 : Color.grisBordure, lineWidth: 2)
                                                                            )
                                                                        Text(type.name)
                                                                            .font(.PoppinsFootnote())
                                                                            .foregroundColor(.black)
                                                                    }
                                        }
                                    }
                                }
                                .padding(.leading, 24)
                                .padding(.top, 20)
                                .background(Color.white)
                            }
                            VStack {
                            HStack(spacing: 8) {
                                Button {
                                    withAnimation {
                                        isIngredientPickerPresented = false
                                        isIngredientUnitPickerPresented = false
                                        isUstensilTypePickerPresented = false
                                        isGalleryPresented = false
                                        isTimePickerPresented = true
                                    }
                                } label: {
                                    RecipeCreationTimeView(recipeTimeHours: $baseViewModel.recipeTimeHours, recipeTimeMinutes: $baseViewModel.recipeTimeMinutes)
                                }
                                
                                CreationDifficultyView(elementDifficulty: $baseViewModel.recipedifficulty)
                            }
                            
                            RecipeDoublePickerView(selectedPart: $baseViewModel.selectedPart)
                            
                            if baseViewModel.selectedPart == .ingredients {
                                
                                VStack (alignment: .leading) {
                                    
                                    HStack {
                                        Text("Ingredients")
                                            .font(.PoppinsTitle3Medium())
                                        
                                        Spacer()
                                        
                                        CreationPortionsView(numberPortionChosen: $baseViewModel.recipePortionNb)
                                    }
                                    
                                    CreationListIngredientsView(listIngredients: $baseViewModel.listIngredients)
                                    
                                    CreationNewIngredientView(isGalleryPresented: $isGalleryPresented,
                                                              isDateOrTimePickerPresented: $isTimePickerPresented,
                                                              isUstensilTypePickerPresented:  $isUstensilTypePickerPresented,
                                                              isIngredientPickerPresented: $isIngredientPickerPresented,
                                                              ingredientChosen: $ingredientChosen,
                                                              listIngredients: $baseViewModel.listIngredients,
                                                              newIngredient: $baseViewModel.newIngredient,
                                                              newIngredientQuantity: $baseViewModel.newIngredientQuantity,
                                                              isIngredientUnitPickerPresented: $isIngredientUnitPickerPresented,
                                                              newIngredientUnit: $baseViewModel.newIngredientUnit)
                                    
                                    Text("Ustensiles")
                                        .font(.PoppinsTitle3Medium())
                                    
                                    CreationListUstensilsView(listUstensils: $baseViewModel.listUstensils)
                                    
                                    CreationNewUstensilView(isGalleryPresented: $isGalleryPresented,
                                                            isDateOrTimePickerPresented: $isTimePickerPresented,
                                                            isIngredientPickerPresented: $isIngredientPickerPresented,
                                                            isIngredientUnitPickerPresented: $isIngredientUnitPickerPresented,
                                                            
                                                            isUstensilTypePickerPresented: $isUstensilTypePickerPresented,
                                                            ustensilChosen: $ustensilChosen,
                                                            listUstensils: $baseViewModel.listUstensils,
                                                            newUstensilType: $baseViewModel.newUstensilType,
                                                            newUstensilName: $baseViewModel.newUstensilName)
                                }
                            } else {
                                
                                RecipeCreationListStepsView(listSteps: $baseViewModel.listSteps)
                                
                                RecipeCreationNewStepView(listSteps: $baseViewModel.listSteps, newStep: $baseViewModel.newStep)
                                
                            }
                            
                            Button {
                                baseViewModel.postRecipe {
                                    presentationMode.wrappedValue.dismiss()
                                }
                            } label: {
                                HStack {
                                    Text("Créer ta recette")
                                        .foregroundStyle(.white)
                                        .font(.PoppinsSubheadMedium())
                                        .padding()
                                        .frame(width: 345)
                                        .frame(height: 40)
                                        .background(baseViewModel.isFormComplete ? Color.red400 : Color.gray)
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                    
                                    
                                }
                                .padding(.vertical)
                            }
                            .disabled(!baseViewModel.isFormComplete)
                        }
                        .padding(20)
                        .padding(.bottom, 20)
                        .background(Color.white)
                        .cornerRadius(20)
                        
                    }
                    .background(Color.white)
                    .cornerRadius(20)
                    .padding(.horizontal, 20)
                    
                    }
                    
                    .padding(.bottom, 20)
                    .cornerRadius(20)
                }
                .padding(.top, 8)
            }
        }
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
        if isTimePickerPresented {
            PickerTimeView(TimeHours: $baseViewModel.recipeTimeHours, TimeMinutes: $baseViewModel.recipeTimeMinutes, isPickerPresented: $isTimePickerPresented)
        }
        if isIngredientPickerPresented {
            PickerIngredientView(isPickerPresented: $isIngredientPickerPresented, ingredientChosen: $ingredientChosen, ingredient: $baseViewModel.newIngredient)
        }
        if isIngredientUnitPickerPresented {
            PickerIngredientUnitView(isPickerPresented: $isIngredientUnitPickerPresented, ingredientUnit: $baseViewModel.newIngredientUnit)
        }
        if isUstensilTypePickerPresented {
            PickerUstensilTypeView(isPickerPresented: $isUstensilTypePickerPresented, ustensilChosen: $ustensilChosen, ustensilType: $baseViewModel.newUstensilType)
        }
        
        if isGalleryPresented {
            CreationGalleryImageView(isGalleryPresented: $isGalleryPresented, imageChosen: $baseViewModel.recipeImage)
        }
        
        
    }
}


#Preview {
    RecipeCreationView()
        .environmentObject(BaseViewModel())
}












