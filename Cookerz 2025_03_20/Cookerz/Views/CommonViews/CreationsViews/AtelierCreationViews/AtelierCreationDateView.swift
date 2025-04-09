//
//  AtelierCreationDateView.swift
//  Cookerz
//
//  Created by apprenant98 on 14/03/2025.
//


import SwiftUI

struct AtelierCreationDateView: View {
    var atelierDateChosen : Bool
    var atelierDate: String
    
    var body: some View {
        VStack {
            Image("calendar")
                .resizable()
                .frame(width: 20, height: 20)
                .padding(2)
            if atelierDateChosen == false {
                Text("Choisir une date")
                    .foregroundStyle(.black)
            } else {
                Text(atelierDate)
                    .foregroundStyle(.black)
                    .font(.PoppinsSubhead())
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity)
        .background(Color.red50)
        .cornerRadius(16)
    }
}
