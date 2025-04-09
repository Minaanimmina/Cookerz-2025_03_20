//
//  JoinChallengeView.swift
//  Cookerz
//
//  Created by apprenant87 on 14/03/2025.
//

import SwiftUI

struct JoinChallengeView: View {
    var body: some View {
        VStack {
            Text("Prêt(e) à")
                .font(.PoppinsBodyMedium())
                .padding(.top, 5)
            Text("valider le défi ?")
                .font(.PoppinsBodyMedium())
                .padding(.bottom, 5)
            
            PrimaryButtonView(title: "Prendre une photo", buttonBgColor: .red400, maxWidth: 220) {
                // CODE BOUTON
            }
            
            Button {
                // CODE BOUTON
            } label: {
                Text("Pas maintenant")
                    .foregroundStyle(Color.black)
                    .font(.PoppinsFootnoteMedium())
                    .underline()
            }

        }
        .padding(20)
        .frame(width: 260, height: 204)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.grisBordure, lineWidth: 0.5)
        )
    }
}

#Preview {
    JoinChallengeView()
}
