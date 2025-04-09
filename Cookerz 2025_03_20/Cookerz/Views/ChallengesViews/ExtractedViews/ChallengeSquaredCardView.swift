//
//  ChallengeSquaredCardView.swift
//  Cookerz
//
//  Created by apprenant87 on 10/03/2025.
//


import SwiftUI

struct ChallengeSquaredCardView: View {
    @EnvironmentObject var baseViewModel: BaseViewModel

    var challenge: Challenge
    var backgroundColor: Color {
        if let index = baseViewModel.allChallenges.firstIndex(where: { $0.id == challenge.id }) {
            let challenge = baseViewModel.allChallenges[index] // Stocke le challenge une fois

            if challenge.challengeStatus == .isFinished {
                return Color.lightGreen
            } else if challenge.challengeStatus == .onGoing {
                return Color.brightYellow100
            } else {
                return .red50
            }
        }
        return .red50 // Valeur par défaut si le challenge n'est pas trouvé
    }
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Image(challenge.icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    
                    // call ChallengesPointView
                    ChallengesPointView(challenge: challenge, bgColor: Color.white)
                }
                .padding(.trailing, 8)
                
                Text(challenge.name)
                    .font(.PoppinsFootnote())
                    .foregroundStyle(.black)
                    .lineLimit(2)
                    .truncationMode(.tail)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
                        
                    }
        .padding(.horizontal, 10)
        .frame(width: 200, height: 100)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    ChallengeSquaredCardView(
        challenge: challenges[8])
    .environmentObject(BaseViewModel())

}

