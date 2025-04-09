//
//  ProfilPriveMyChallengesView.swift
//  Cookerz
//
//  Created by apprenant87 on 17/03/2025.
//

import SwiftUI

struct ProfilPriveMyChallengesView: View {
    @EnvironmentObject var baseViewModel: BaseViewModel
    
    // couleurs alternance carte défis
//    let colors: [Color] = [.red50, .brightYellow100, .lightGreen]
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("En cours")
                    .font(.PoppinsTitle3Medium())
//                    .padding(.bottom, 16)
                ForEach(Array(baseViewModel.onGoingChallenges.enumerated()), id: \.element.name) { index, challenge in
                    NavigationLink(destination: ChallengeBigRectangleCardView(challenge: challenge))
                    {
                        OngoingUserChallengesView(challenge: challenge)
                            .background(.brightYellow100)
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                            .foregroundColor(.black)
                    }
                }
                
                // TODO: à vérifier
                Text("Terminés")
                    .font(.PoppinsTitle3Medium())
//                    .padding(.bottom, 16)
//                    .padding(.top, 20)
                ForEach(Array(baseViewModel.finishedChallenges.enumerated()), id: \.element.name) { index, challenge in
                    NavigationLink(destination: ChallengeBigRectangleCardView(challenge: challenge))
                    {
                        OngoingUserChallengesView(challenge: challenge)
                            .background(.lightGreen)
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}


#Preview {
    ProfilPriveMyChallengesView()
        .environmentObject(BaseViewModel())
}
