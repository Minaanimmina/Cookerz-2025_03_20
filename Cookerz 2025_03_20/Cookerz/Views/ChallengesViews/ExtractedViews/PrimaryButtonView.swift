//
//  PrimaryButtonView.swift
//  Cookerz
//
//  Created by apprenant87 on 10/03/2025.
//

import SwiftUI

struct PrimaryButtonView: View {
    var title: String
    var buttonBgColor: Color
    var maxWidth: CGFloat? = .infinity
    let action: () -> Void
    
    var body: some View {
        VStack {
            Button(action: action) {
                Text(title)
                    .foregroundStyle(.white)
                    .font(.PoppinsSubheadMedium())
                    .padding()
                    .frame(maxWidth: maxWidth)
                    .frame(height: 40)
                    .background(buttonBgColor)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
    }
}


