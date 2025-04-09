//
//  AtelierCreationView.swift
//  Cookerz
//
//  Created by apprenant98 on 17/03/2025.
//



import SwiftUI

struct AtelierCreationView: View {
    @Environment(\.presentationMode) private var presentationMode
    
    @StateObject private var creationViewModel = AtelierCreationViewModel()
    
    @State private var isDatePickerPresented = false
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
                    ZStack {
                        CreationImageView(isDateTimePickerPresented: $isDatePickerPresented, isIngredientPickerPresented: $isIngredientPickerPresented, isIngredientUnitPickerPresented: $isIngredientUnitPickerPresented, isUstensilTypePickerPresented: $isUstensilTypePickerPresented, isGalleryPresented: $isGalleryPresented, elementImage: $creationViewModel.atelierImage)
                    }
                    
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
                        
                        VStack(spacing: 8) {
                            HStack {
                                TextField("Nom de la recette", text: $creationViewModel.atelierTitle)
                                    .font(.PoppinsTitle3Medium())
                            }
                            .padding(.vertical, 10)
                            
                            HStack(spacing: 8) {
                                Button {
                                    withAnimation {
                                        isIngredientPickerPresented = false
                                        isIngredientUnitPickerPresented = false
                                        isUstensilTypePickerPresented = false
                                        isGalleryPresented = false
                                        isDatePickerPresented = true
                                    }
                                } label: {
                                    AtelierCreationDateView(atelierDateChosen: creationViewModel.atelierDateChosen, atelierDate: creationViewModel.formattedDate)
                                }
                                
                                CreationDifficultyView(elementDifficulty: $creationViewModel.atelierDifficulty)
                            }
                            
                            AtelierDoublePickerView(selectedPart: $creationViewModel.selectedPart)
                            
                            if creationViewModel.selectedPart == .description {
                                ZStack(alignment: .topLeading) {
                                    TextEditor(text: $creationViewModel.atelierDescription)
                                        .font(.caption)
                                        .background(Color.white)
                                        .cornerRadius(8)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 8.0)
                                                .stroke(.grisBordure, lineWidth: 2))
                                        .colorScheme(.light)
                                    
                                    if creationViewModel.atelierDescription.isEmpty {
                                        Text("Ajouter une description")
                                            .foregroundColor(.black)
                                            .font(.subheadline)
                                            .padding([.top, .leading], 8)
                                    }
                                }
                                .frame(width: .infinity, height: 250)
                                .padding(.horizontal, 8)
                                .cornerRadius(8)
                                
                            }else  {
                                VStack (alignment: .leading) {
                                    HStack {
                                        Text("Ingredients")
                                            .font(.PoppinsTitle3Medium())
                                        
                                        Spacer()
                                    }
                                    
                                    CreationListIngredientsView(listIngredients: $creationViewModel.listIngredients)
                                    CreationNewIngredientView(isGalleryPresented: $isGalleryPresented,
                                                              isDateOrTimePickerPresented: $isDatePickerPresented,
                                                              isUstensilTypePickerPresented:  $isUstensilTypePickerPresented,
                                                              isIngredientPickerPresented: $isIngredientPickerPresented,
                                                              ingredientChosen: $ingredientChosen,
                                                              listIngredients: $creationViewModel.listIngredients,
                                                              newIngredient: $creationViewModel.newIngredient,
                                                              newIngredientQuantity: $creationViewModel.newIngredientQuantity,
                                                              isIngredientUnitPickerPresented: $isIngredientUnitPickerPresented,
                                                              newIngredientUnit: $creationViewModel.newIngredientUnit)
                                    
                                    Text("Ustensiles")
                                        .font(.PoppinsTitle3Medium())
                                    
                                    CreationListUstensilsView(listUstensils: $creationViewModel.listUstensils)
                                    
                                    CreationNewUstensilView(isGalleryPresented: $isGalleryPresented,
                                                            isDateOrTimePickerPresented: $isDatePickerPresented,
                                                            isIngredientPickerPresented: $isIngredientPickerPresented,
                                                            isIngredientUnitPickerPresented: $isIngredientUnitPickerPresented,
                                                            isUstensilTypePickerPresented: $isUstensilTypePickerPresented,
                                                            ustensilChosen: $ustensilChosen,
                                                            listUstensils: $creationViewModel.listUstensils,
                                                            newUstensilType: $creationViewModel.newUstensilType,
                                                            newUstensilName: $creationViewModel.newUstensilName)
                                }
                            }
                            
                            Button {
                                creationViewModel.postAtelier() {
                                    presentationMode.wrappedValue.dismiss()
                                }
                            } label: {
                                HStack {
                                        Text("Créer ton atelier")
                                            .foregroundStyle(.white)
                                            .font(.PoppinsSubheadMedium())
                                            .padding()
                                            .frame(width: 345)
                                            .frame(height: 40)
                                            .background(creationViewModel.isFormComplete ? Color.red400 : Color.gray)
                                            .clipShape(RoundedRectangle(cornerRadius: 8))
                                    
                                        
                                }
                                .padding(.vertical)
                            }
                            .disabled(!creationViewModel.isFormComplete)
                        }
                        .padding(20)
                        .padding(.bottom, 20)
                        .background(Color.white)
                        .cornerRadius(20)
                    }
                    .padding(20)
                    .padding(.bottom, 20)
                    .cornerRadius(20)
                }
                .padding(.top, 8)
            }
        }
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
        if isDatePickerPresented {
            AtelierPickerDateView(atelierDateChosen: $creationViewModel.atelierDateChosen, isPickerPresented: $isDatePickerPresented, atelierDate: $creationViewModel.atelierDate)
        }
        if isIngredientPickerPresented {
            PickerIngredientView(isPickerPresented: $isIngredientPickerPresented, ingredientChosen: $ingredientChosen, ingredient: $creationViewModel.newIngredient)
        }
        if isIngredientUnitPickerPresented {
            PickerIngredientUnitView(isPickerPresented: $isIngredientUnitPickerPresented, ingredientUnit: $creationViewModel.newIngredientUnit)
        }
        if isUstensilTypePickerPresented {
            PickerUstensilTypeView(isPickerPresented: $isUstensilTypePickerPresented, ustensilChosen: $ustensilChosen, ustensilType: $creationViewModel.newUstensilType)
        }
        if isGalleryPresented {
            CreationGalleryImageView(isGalleryPresented: $isGalleryPresented, imageChosen: $creationViewModel.atelierImage)
        }
    }
}

#Preview {
    AtelierCreationView()
}


