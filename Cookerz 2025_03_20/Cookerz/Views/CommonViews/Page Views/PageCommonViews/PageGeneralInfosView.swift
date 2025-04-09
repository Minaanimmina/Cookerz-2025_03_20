//
//  PageGeneralInfosView.swift
//  Cookerz
//
//  Created by apprenant98 on 13/03/2025.
//

import SwiftUI

struct PageGeneralInfosView: View {
    var GeneralInfoIcon : String
    var GeneralInfoText : String
    var body: some View {
        VStack {
            Image(GeneralInfoIcon)
                .frame(width: 24, height: 24)
            Text(GeneralInfoText)
                .font(.PoppinsSubhead())
            
        }
        .padding(16)
        .frame(maxWidth: .infinity)
        .background(Color.red50)
        .cornerRadius(16)
    }
}


#Preview {
    RecipePageView (recipe : recipes[0])
}
