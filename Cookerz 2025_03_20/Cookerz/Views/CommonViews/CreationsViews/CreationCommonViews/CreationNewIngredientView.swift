//
//  CreationNewIngredientView.swift
//  Cookerz
//
//  Created by apprenant98 on 17/03/2025.
//


import SwiftUI

struct CreationNewIngredientView: View {
    @Binding var isGalleryPresented : Bool
    @Binding var isDateOrTimePickerPresented : Bool
    @Binding var isUstensilTypePickerPresented : Bool
    @Binding var isIngredientPickerPresented : Bool
    
    @Binding var ingredientChosen : Bool
    
    @Binding var listIngredients : [Ingredient]
    @Binding var newIngredient : Ingredient
    @Binding var newIngredientQuantity : String
    @Binding var isIngredientUnitPickerPresented : Bool
    @Binding var newIngredientUnit : IngredientUnit
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .frame(width: .infinity, height: 54)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color.grisBordure, lineWidth: 1))
            HStack {
                Button {
                    isGalleryPresented = false
                    isDateOrTimePickerPresented = false
                    isUstensilTypePickerPresented = false
                    isIngredientUnitPickerPresented = false
                    isIngredientPickerPresented = true
                }label :{
                    HStack {
                        if ingredientChosen == false {
                            Text("Ingredient")
                        } else {
                            HStack {
                                Image(newIngredient.type.Icon)
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                Text(newIngredient.name)
                                    .lineLimit(1) 
                                    .truncationMode(.tail)
                            }
                        }
                    }
                    .foregroundStyle(.black)
                    .padding(.horizontal)
                    .padding(.vertical,10)
                    .frame(maxWidth: .infinity)
                    .background(Color.red50)
                    .cornerRadius(100)
                }
                Spacer()
                VStack (alignment: .trailing){
                    TextField ("Qt", text: $newIngredientQuantity)
                        .frame(height: 8)
                        .keyboardType(.numberPad)
                        .onChange(of: newIngredientQuantity) { quantity in
                            let filtered = quantity.filter { $0.isNumber || $0 == "." || $0 == "," }
                            

                            if filtered != quantity {
                                newIngredientQuantity = filtered
                            }
                        }
                }
                .frame(width: 60)
                .padding()
                .background(Color.grisFond)
                .cornerRadius(10)
                
                Button {
                    isGalleryPresented = false
                    isDateOrTimePickerPresented = false
                    isUstensilTypePickerPresented = false
                    isIngredientPickerPresented = false
                    isIngredientUnitPickerPresented = true
                }label :{
                    HStack {
                        Text(newIngredientUnit != .piece ? newIngredientUnit.initial : newIngredientUnit.name )
                    }
                    .foregroundStyle(.black)
                    .padding(.horizontal)
                    .padding(.vertical,10)
                    .background(Color.red50)
                    .cornerRadius(100)
                }
                
                
                Button{
                    if ingredientChosen && !newIngredientQuantity.isEmpty {
                        listIngredients.append(Ingredient(name: newIngredient.name, type: newIngredient.type, quantity: Double(newIngredientQuantity), unit : newIngredientUnit ))
                        ingredientChosen = false
                        newIngredientQuantity = ""
                    }
                    
                }label: {
                    Image("add_button")
                }
            }
            .padding(.horizontal, 8)
        }
    }
}

#Preview {
    RecipeCreationView()
}
