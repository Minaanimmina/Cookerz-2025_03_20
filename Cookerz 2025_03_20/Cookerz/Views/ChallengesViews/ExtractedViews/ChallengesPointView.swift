//
//  ChallengesPointView.swift
//  Cookerz
//
//  Created by apprenant87 on 10/03/2025.
//

import SwiftUI

struct ChallengesPointView: View {
    var challenge: Challenge
    var bgColor: Color
    
    var body: some View {
        
        HStack {
            Text("\(challenge.points)")
                .font(.PoppinsCaption1Medium())
                .foregroundStyle(.black)
            Image(.radishPoints)
                .resizable()
                .frame(width: 12, height: 15)
                .rotationEffect(.degrees(180))
                .scaleEffect(x: 1, y: -1)
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
        .background(bgColor)
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}




