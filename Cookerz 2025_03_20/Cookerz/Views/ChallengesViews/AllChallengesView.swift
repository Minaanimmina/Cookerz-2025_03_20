//
//  AllChallengesView.swift
//  Cookerz
//
//  Created by apprenant87 on 10/03/2025.
//

import SwiftUI

struct AllChallengesView: View {
    
    @EnvironmentObject var baseViewModel: BaseViewModel
    
    // couleurs alternance carte défis populaires
    let colors: [Color] = [.red50, .brightYellow100, .lightGreen]
    // tableau local pour avoir seulement quelques défis dans "Défis populaires"
    var popChallenges = [challenges[2], challenges[4], challenges[6]]
    
    // colonnes pour LazyVGrid
    let columns = [
        GridItem(.flexible(), spacing: 4.5),
        GridItem(.flexible(), spacing: 4.5)
    ]
    
    // méthode et var pour bouton défi aléatoire affiché dans navLink
    @State var randomChallenge: Challenge?
    @State var navigateToRandomChallenge = false
    
    func getRandomChallenge() {
        randomChallenge = baseViewModel.allChallenges.randomElement() ?? challenge0
        navigateToRandomChallenge = true
    }
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                VStack {
                    // titre section
                    Text("Défis en cours")
                        .font(.PoppinsTitle3Medium())
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 5)
                        .padding(.leading, 24)
                    
                    // call ChallengeSquaredCardView dans NavLink
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            Spacer().frame(width: 12)
                            ForEach(Array(baseViewModel.onGoingChallenges.enumerated()), id: \.element.name) { index, challenge in
                                NavigationLink {
                                    ChallengeBigRectangleCardView(challenge: challenge )
                                } label: {
                                    ChallengeSquaredCardView(challenge: challenge)
                                }
                            }
                        }
                    }
                    
                    // CTA Lance toi un défi
                    NavigationLink(
                        destination: ChallengeBigRectangleCardView(challenge: randomChallenge ?? challenge0),
                        isActive: $navigateToRandomChallenge
                    ) {
                        PrimaryButtonView(title: "Lance toi un défi aléatoire", buttonBgColor: Color.red400) {
                            getRandomChallenge()
                        }
                        .padding(.leading, 24)
                        .padding(.trailing, 24)
                        .padding(.bottom, -10)
                    }
                    
                    
                    // titre section
                    Text("Tous les défis")
                        .font(.PoppinsTitle3Medium())
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 24)
                        .padding(.bottom, 5)
                    
                    
                    // call ChallengeSmallRectangleCardView dans une navigationlink
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(Array(baseViewModel.allChallenges.enumerated()), id: \.element.id) { index, challenge in
                            // navigationLink pour afficher les détails du défi
                            NavigationLink(destination: ChallengeBigRectangleCardView(challenge: challenge)) {
                                ChallengeSmallRectangleCardView(challenge: challenge)
                            }
                        }
                        .foregroundStyle(.black)
                    }
                    .padding(.leading, 24)
                    .padding(.trailing, 24)
                }
            }
        }
    }
}

#Preview {
    AllChallengesView(randomChallenge: challenges[0]) .environmentObject(BaseViewModel())
}
