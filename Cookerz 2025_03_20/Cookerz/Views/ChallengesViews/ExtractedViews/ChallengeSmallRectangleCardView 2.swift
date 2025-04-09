//
//  ChallengeSmallRectangleCardView.swift
//  Cookerz
//
//  Created by apprenant87 on 10/03/2025.
//

import SwiftUI

struct ChallengeSmallRectangleCardView2: View {
    var challenge: Challenge
    
    var body: some View {
        HStack {
            VStack(alignment: .center) {
                Image(challenge.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                
                // call ChallengesPointView
                ChallengesPointView(challenge: challenge, bgColor: Color.grisFond)

            }
            .padding(.trailing, 15)
            
            VStack(alignment: .leading) {
                Text(challenge.name)
                    .font(.PoppinsFootnoteMedium())
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 2)
                
                Text(challenge.description)
                    .font(.PoppinsCaption2Light())
                    .multilineTextAlignment(.leading)
                    .truncationMode(.tail)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(15)
        .frame(width: 345, height: 95)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.lightGreen, lineWidth: 2)
        )
    }
}



#Preview {
    ChallengeSmallRectangleCardView2(challenge: challenges[0])
}
