//
//  CreationNewUstensilView.swift
//  Cookerz
//
//  Created by apprenant98 on 17/03/2025.
//


import SwiftUI

struct CreationNewUstensilView: View {
    @Binding var isGalleryPresented : Bool
    @Binding var isDateOrTimePickerPresented : Bool
    @Binding var isIngredientPickerPresented : Bool
    @Binding var isIngredientUnitPickerPresented : Bool
    
    @Binding var isUstensilTypePickerPresented : Bool
    @Binding var ustensilChosen : Bool
    
    @Binding var listUstensils : [Ustensil]
    @Binding var newUstensilType : UstensilType
    @Binding var newUstensilName : String
    
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
                    isIngredientPickerPresented = false
                    isIngredientUnitPickerPresented = false
                    isUstensilTypePickerPresented = true
                }label :{
                    HStack {
                        if ustensilChosen == false {
                            Text("Ustensil")
                        }else{
                            Image(newUstensilType.Icon)
                                .resizable()
                                .frame(width: 20, height: 20)
                            Text(newUstensilType.name)
                                .lineLimit(1)
                                .truncationMode(.tail)
                        }
                    }
                    .foregroundStyle(.black)
                    .padding(.horizontal)
                    .padding(.vertical,10)
                    .background(Color.red50)
                    .cornerRadius(100)
                }
                Spacer()
                VStack (alignment: .trailing){
                    TextField ("Name", text: $newUstensilName)
                }
                .frame(height: 8)
                .padding()
                .background(Color.grisFond)
                .cornerRadius(10)
                
                Button{
                    if ustensilChosen {
                        listUstensils.append(Ustensil( name : newUstensilName, type: newUstensilType))
                        ustensilChosen = false
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
