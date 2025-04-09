//
//  RecipePageTimeView.swift
//  Cookerz
//
//  Created by apprenant98 on 13/03/2025.
//

import SwiftUI

struct RecipePageTimeView : View {
    var recipe : Recipe
    var body: some View {
        VStack {
            Image("minuteur")
                .resizable()
                .frame(width: 20, height: 20)
                .padding(2)
            if recipe.durationHours == 0 {
                Text("\(recipe.durationMinutes) min")
            } else {
                Text("\(recipe.durationHours) h \(recipe.durationMinutes) mn")
            }
        }
        .font(.PoppinsSubhead())
        .padding(16)
        .frame(maxWidth: .infinity)
        .background(Color.red50)
        .cornerRadius(16)
    }
}

#Preview {
    RecipePageView (recipe : recipes[0])
        .environmentObject(BaseViewModel())
}
