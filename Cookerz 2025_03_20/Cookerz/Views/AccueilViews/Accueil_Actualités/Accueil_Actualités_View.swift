//
//  Accueil_Actualités_View.swift
//  Cookerz
//
//  Created by Carole TREM on 11/03/2025.
//

import SwiftUI

struct Accueil_Actualités_View: View {
    @EnvironmentObject var baseViewModel: BaseViewModel
    


//    var challengeStatus: ChallengeStatus {
//        if let index = baseViewModel.user.listChallenges.firstIndex(where: { $0.id == selectedChallenge.id}) {
//            return baseViewModel.user.listChallenges[index].challengeStatus
//        } else {
//            return .isNotStarted
//        }
//    }
    
    
    
//    func backgroundColor() -> Color {
//        switch challengeStatus {
//        case .isNotStarted:
//            return Color.red50
//        case .onGoing:
//            return Color.brightYellow100
//        case .isFinished:
//            return Color.lightGreen
//        
//        }
//    }
    
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView {
                HStack {
                    Text("Défis populaires")
                        .font(.PoppinsTitle3Medium())
                        .padding(.top, 5)
                        .padding(.bottom, 3)
                    Spacer()
                }
                .padding(.leading, 24)
                
                // call ChallengeSquaredCardView et NavLink
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(Array(baseViewModel.allChallenges.enumerated()), id: \.element.name) { index, challenge in
                            
                            NavigationLink {
                                ChallengeBigRectangleCardView(challenge: challenge )
                            } label: {
                                ChallengeSquaredCardView(challenge: challenge)
                                                           
                            }
                        }
                    }
                    .padding(.leading, 24)
                    .padding(.bottom, 5)
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Dernières fournées !")
                            .font(.PoppinsTitle3Medium())
                            .padding(.bottom, 3)
                    }
                    .padding(.leading, 24)
                    
                    LazyVStack(spacing: 10) {
                        ForEach(baseViewModel.postsVM) { post in
                            Post_View(post: post)
                        }
                    }
                }
            }
        }
    }
}


#Preview {
    Accueil_Actualités_View().environmentObject(BaseViewModel())
}
