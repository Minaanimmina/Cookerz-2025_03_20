//
//  ChallengeSmallRectangleCardView.swift
//  Cookerz
//
//  Created by apprenant87 on 10/03/2025.
//

import SwiftUI

struct ChallengeSmallRectangleCardView: View {
    var challenge: Challenge
    
    var body: some View {
        VStack {
//            Spacer()
//                .frame(height: 15)
            Image(challenge.icon)
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 32)
                .padding(.top, 8)
            Text(challenge.name)
                .font(.PoppinsFootnoteMedium())
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .frame(maxHeight: 40)
                .padding(.vertical, 10)
                .fixedSize(horizontal: false, vertical: true)
            Text(challenge.description)
                .font(.PoppinsCaption2Light())
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, alignment: .bottom)
                .truncationMode(.tail)
            
            Spacer()
            
            // call ChallengesPointView
            ChallengesPointView(challenge: challenge, bgColor: .grisFond)
                .padding(.bottom, 15)
                
            }
            .padding(15)
            .frame(width: 165, height: 259)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.lightGreen, lineWidth: 2)
            )
        }
    }



#Preview {
    ChallengeSmallRectangleCardView(challenge: challenges[19])
}
