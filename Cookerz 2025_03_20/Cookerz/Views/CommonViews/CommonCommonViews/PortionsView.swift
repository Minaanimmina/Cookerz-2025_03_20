//
//  PortionsView.swift
//  Cookerz
//
//  Created by apprenant98 on 13/03/2025.
//

import SwiftUI

struct PortionsView: View {
    @Binding var numberPortionChosen : Int
    var body: some View {
        HStack {
            Button {
                if numberPortionChosen > 0 {
                    numberPortionChosen -= 1
                }
                
            }label : {
                if numberPortionChosen > 0 {
                    ButtonPortionView(textSymbol :"-")}
            }
            
            HStack {
                Text ("\(numberPortionChosen) pers")
                    .font(.PoppinsCaption2())
            }
            .padding()
            .background(Color.red50)
            .cornerRadius(200)
        }
        
        Button {
            numberPortionChosen += 1
            
        }label : {
            ButtonPortionView(textSymbol :"+")}
    }
}


#Preview {
    RecipePageView (recipe : recipes[0])
}
