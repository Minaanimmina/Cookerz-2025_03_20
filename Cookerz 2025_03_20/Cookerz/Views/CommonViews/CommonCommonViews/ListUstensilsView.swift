//
//  UstensilView.swift
//  Cookerz
//
//  Created by apprenant98 on 11/03/2025.
//

import SwiftUI

struct ListUstensilsView: View {
    var listUstensils : [Ustensil] = []
    var body: some View {
        ForEach(listUstensils) { ustensil in
            HStack {
                Image(ustensil.type.Icon)
                    .resizable()
                    .frame(width: 24, height: 24)
                Text(ustensil.type.name)
                    .font(.PoppinsCallout())
                Spacer()
                Text(ustensil.name.capitalized ?? "")
                    .font(.PoppinsSubhead())
                    .foregroundStyle(.black.opacity(0.7))
                
            }
        }
    }
}


#Preview {
    RecipePageView (recipe : recipes[0])
}
