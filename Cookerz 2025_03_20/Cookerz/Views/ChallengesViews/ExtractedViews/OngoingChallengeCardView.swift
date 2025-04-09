//
//  OngoingUserChallengesView.swift
//  Cookerz
//
//  Created by apprenant87 on 12/03/2025.
//

import SwiftUI

struct OngoingUserChallengesView: View {
    
    var challenge: Challenge
    
    var body: some View {
        HStack {
            VStack {
                Image(challenge.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 37)
                
                ChallengesPointView(challenge: challenge, bgColor: .white)
            }
            .padding(.leading, 18)
            .padding(.vertical, 10)
            
            Text(challenge.name)
                .font(.PoppinsSubhead())
                .padding(.leading, 27)
            
            Spacer()
        }
        .frame(width: 340, height: 96)
    }
}

#Preview {
    OngoingUserChallengesView(challenge: challenges[19])
}

