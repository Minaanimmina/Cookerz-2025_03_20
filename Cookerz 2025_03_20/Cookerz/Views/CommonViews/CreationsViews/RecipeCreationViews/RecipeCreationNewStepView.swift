//
//  RecipeCreationNewStepView.swift
//  Cookerz
//
//  Created by apprenant98 on 14/03/2025.
//


import SwiftUI

struct RecipeCreationNewStepView: View {
    @Binding var listSteps: [String]
    @Binding var newStep: String
    var body: some View {
        HStack {
            Button {
                if !newStep.isEmpty {
                    listSteps.append(newStep)
                    newStep = ""
                }
            } label: {
                Image("add_button")
            }
            
            ZStack(alignment: .topLeading) {
                TextEditor(text: $newStep)
                    .font(.caption)
                    .background(Color.white)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8.0)
                            .stroke(.grisBordure, lineWidth: 2))
                    .colorScheme(.light)
                
                if newStep.isEmpty {
                    Text("Ajouter une étape")
                        .foregroundColor(.black)
                        .font(.subheadline)
                        .padding([.top, .leading], 8)
                }
            }
            .frame(width: .infinity, height: 150)
            .padding(.horizontal, 8)
            .cornerRadius(8)
            
        }
    }
}

#Preview {
    RecipeCreationView()
}
