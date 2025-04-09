//
//  PickerUstensilTypeView.swift
//  Cookerz
//
//  Created by apprenant98 on 11/03/2025.
//

import SwiftUI

struct PickerUstensilTypeView: View {
    @Binding var isPickerPresented : Bool
    @Binding var ustensilChosen : Bool
    
    @Binding var ustensilType: UstensilType
    
    var body: some View {
        VStack {
            HStack {
                Text ("Type d'ustensil")
                    .foregroundStyle(Color.black)
                Spacer()
                Button {
                    ustensilChosen = true
                    isPickerPresented = false
                } label: {
                    Text("Valider")
                        .foregroundStyle(Color.blue)
                }
            }
            .padding()
            .background(Color.grisFond.opacity(0.5))
            .cornerRadius(10)
            
            HStack {
                Spacer()
                Picker("Type d'ustensile", selection: $ustensilType) {
                    ForEach(UstensilType.allCases, id: \.self) { ustensil in
                        HStack {
                            Image(ustensil.Icon)
                                .resizable()
                                .frame(width: 25, height: 25)
                            Text(ustensil.name)
                        }
                    }
                }
                .pickerStyle(.wheel)
            }
        }
        .padding(.horizontal, 25)
        .frame(maxHeight: 250)
        .background(Color.white)
    }
}

//#Preview {
//    RecipeCreationView(newUstensilType: .cookerMachine)
//}
