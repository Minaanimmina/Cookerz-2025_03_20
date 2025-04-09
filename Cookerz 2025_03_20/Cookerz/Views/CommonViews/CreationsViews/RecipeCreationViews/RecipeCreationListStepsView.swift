//
//  RecipeCreationListStepsView.swift
//  Cookerz
//
//  Created by apprenant98 on 14/03/2025.
//


import SwiftUI

struct RecipeCreationListStepsView: View {
    @Binding var listSteps: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            ForEach(listSteps, id: \.self) { step in
                HStack {
                    HStack {
                        Text("\(listSteps.firstIndex(of: step)! + 1)")
                            .font(.PoppinsSubhead())
                    }
                    .frame(width: 30, height: 30)
                    .background(Color.red50)
                    .cornerRadius(100)
                    
                    
                    Text(step)
                        .font(.PoppinsFootnote())
                    
                    Spacer()
                    
                    Button {
                        if let index = listSteps.firstIndex(of: step) {
                            listSteps.remove(at: index)
                            
                        }
                    } label: {
                        ButtonPortionView(textSymbol: "x")
                    }
                }
                .padding(.horizontal, 8)
                .padding(.vertical)
            }
        }
    }
}
