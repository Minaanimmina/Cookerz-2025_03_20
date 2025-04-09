//
//  CreationImageView.swift
//  Cookerz
//
//  Created by apprenant98 on 19/03/2025.
//


import SwiftUI

struct CreationImageView: View {
    @Binding var isDateTimePickerPresented: Bool
    @Binding var isIngredientPickerPresented: Bool
    @Binding var isIngredientUnitPickerPresented: Bool
    @Binding var isUstensilTypePickerPresented: Bool
    @Binding var isGalleryPresented: Bool
    @Binding var elementImage : String?
    var body: some View {
        ZStack {
            if elementImage == nil {
                Rectangle()
                    .fill(Color.grisFond)
                    .frame(width: UIScreen.main.bounds.width, height: 300)
                    .ignoresSafeArea()
            } else {
                BackgroungImage(imageName: elementImage!)
            }
            Button {
                isDateTimePickerPresented = false
                isIngredientPickerPresented = false
                isIngredientUnitPickerPresented = false
                isUstensilTypePickerPresented = false
                isGalleryPresented = true
                
                
            } label: {
                VStack {
                    Image("addPhoto")
                    if elementImage == nil {
                        Text("Ajouter une photo")
                            .foregroundStyle(.black)
                    } else {
                        Text("Changer la photo")
                            .foregroundStyle(.black)
                    }
                }
                .padding()
                .background(Color.white.opacity(0.5))
                .cornerRadius(10)
                .padding(.top)
            }
        }
    }
}