//
//  Defis_EnCours.swift
//  Cookerz
//
//  Created by Carole TREM on 11/03/2025.
//

import SwiftUI

struct Defis_Encours_View: View {
    
    @EnvironmentObject var baseViewModel: BaseViewModel
    
    let colors: [Color] = [.red50, .brightYellow100, .lightGreen]
    
    var body: some View {

        ScrollView(.horizontal) {
            
            HStack {
                if !baseViewModel.onGoingChallenges.isEmpty {
                    
                    ForEach(Array(baseViewModel.onGoingChallenges.enumerated()), id: \.element.id) { index, challenge in
                        
                        NavigationLink(destination: ChallengeBigRectangleCardView(challenge: challenge))
                        {
                            ChallengeSquaredCardView(challenge: challenge)
                        }
                    }
                } else {
                    Text("Pas de défis en cours")
                        .font(.PoppinsSubhead())
                        .foregroundColor(.mediumGray)
                }
            }.frame(maxHeight: 130)
        }
    }
}

#Preview {
    Defis_Encours_View().environmentObject(BaseViewModel())
}
