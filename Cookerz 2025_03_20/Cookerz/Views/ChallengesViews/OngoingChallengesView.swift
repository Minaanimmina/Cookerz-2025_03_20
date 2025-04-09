//
//  OngoingChallengesView.swift
//  Cookerz
//
//  Created by apprenant87 on 10/03/2025.
//

import SwiftUI

struct OngoingChallengesView: View {
    
    @EnvironmentObject var baseViewModel: BaseViewModel
    
    let challenge: Challenge
    
//    // couleurs alternance carte défis
//    let colors: [Color] = [.red50, .brightYellow100, .lightGreen]
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    // call OngoingChallengeCardView
                    ForEach(Array(baseViewModel.finishedChallenges.enumerated()), id: \.element.name) { index, challenge in
                        NavigationLink(destination: ChallengeBigRectangleCardView(challenge: challenge))
                        {
                            OngoingUserChallengesView(challenge: challenge)
                                .background(Color.lightGreen)
                                .clipShape(RoundedRectangle(cornerRadius: 25))
                                .foregroundColor(.black)
                        }
                    }
                }
            }.padding(.top)
        }
    }
}

#Preview {
    OngoingChallengesView(challenge : challenge0).environmentObject(BaseViewModel())
}
