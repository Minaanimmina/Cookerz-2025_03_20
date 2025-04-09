//
//  CreationListUstensilsView.swift
//  Cookerz
//
//  Created by apprenant98 on 14/03/2025.
//


import SwiftUI

struct CreationListUstensilsView: View {
    @Binding var listUstensils: [Ustensil]
    
    func formatNumber(_ number: Double) -> String {
        let formattedNumber = String(format: "%.2f", number)
        
        if formattedNumber.hasSuffix(".00") {
            return String(formattedNumber.prefix { $0 != "." })
        } else {
            return formattedNumber
        }
    }
    
    var body: some View {
        ForEach(listUstensils, id: \.self) { ustensil in
            HStack {
                Image(ustensil.type.Icon)
                    .resizable()
                    .frame(width: 24, height: 24)
                
                Text(ustensil.type.name.capitalized)
                    .font(.body)
                
                Spacer()
                
                Text(ustensil.name)
                    .font(.body)
                
                Spacer()
                
                
                Button {
                    // Remove the ingredient from the list
                    if let index = listUstensils.firstIndex(where: { $0.id == ustensil.id }) {
                        listUstensils.remove(at: index)
                        
                    }
                } label: {
                    ButtonPortionView(textSymbol: "x")
                }
            }
            .padding(.horizontal, 8)
        }
    }
}
