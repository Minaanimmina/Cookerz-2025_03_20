//
//  PageButtonPortionView.swift
//  Cookerz
//
//  Created by apprenant98 on 13/03/2025.
//

import SwiftUI

struct ButtonPortionView: View {
    
    var textSymbol: String
    var body: some View {
        ZStack {
            Circle ()
                .stroke(Color.grisBordure, lineWidth: 1)
                .frame(width: 40, height: 40)
            
            Text(textSymbol)
                .font(.PoppinsFootnote())
                .foregroundStyle(.black)
        }
    }
}


#Preview {
    RecipePageView (recipe : recipes[0])
}
