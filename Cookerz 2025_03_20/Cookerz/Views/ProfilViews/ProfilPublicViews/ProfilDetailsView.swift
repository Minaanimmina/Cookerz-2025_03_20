//
//  ProfilDetailsView.swift
//  Cookerz
//
//  Created by apprenant87 on 17/03/2025.
//


import SwiftUI

struct ProfilDetailsView: View {
    let number: String
    let label: String
    
    var body: some View {
        VStack {
            Text(number)
                .font(.PoppinsCaption1Medium())
                .padding(.bottom, -5)
            Text(label)
                .font(.PoppinsCaption2())
        }
        .frame(width: 70, height: 50)
        .background(RoundedRectangle(cornerRadius: 8).fill(Color.red50))
    }
}

#Preview {
    ProfilDetailsView(number: "65", label: "Suivis")
}
