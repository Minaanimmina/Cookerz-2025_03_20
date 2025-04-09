//
//  RecipeCreationTimeView.swift
//  Cookerz
//
//  Created by apprenant98 on 14/03/2025.
//


import SwiftUI

struct RecipeCreationTimeView: View {
    @Binding var recipeTimeHours: Int
    @Binding var recipeTimeMinutes: Int
    
    var body: some View {
        VStack {
            Image("minuteur")
                .resizable()
                .frame(width: 20, height: 20)
                .padding(2)
            Text("\(recipeTimeHours) h \(recipeTimeMinutes) mn")
                .foregroundStyle(.black)
                .font(.PoppinsSubhead())
        }
        .padding(16)
        .frame(maxWidth: .infinity)
        .background(Color.red50)
        .cornerRadius(16)
    }
}
