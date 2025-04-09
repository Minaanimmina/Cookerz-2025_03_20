//
//  RewardSmallRectangleCardView.swift
//  Cookerz
//
//  Created by apprenant87 on 11/03/2025.
//

import SwiftUI

struct RewardSmallRectangleCardView: View {
    var reward: Reward
    
    var body: some View {
        VStack {

                Image(reward.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 65)
                    .frame(maxWidth: 65)
                    .frame(maxHeight: 50)
                    .padding(.bottom, 6)
                
                VStack (alignment: .center) {
                    Text(reward.name)
                        .font(.PoppinsFootnote())
                        .frame(maxWidth: 160)
                        .lineLimit(...3)
                        .truncationMode(.tail)
                    Spacer()
                    // nbre points de la récompense
                    HStack {
                        Text("\(reward.points)")
                            .font(.PoppinsCaption2Medium())
                            .foregroundStyle(.black)
                        Image(.radishPoints)
                            .resizable()
                            .frame(width: 12, height: 15)
                            .rotationEffect(.degrees(180))
                            .scaleEffect(x: 1, y: -1)
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.grisFond)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .padding(.top, 10)
                }
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 20)
        .foregroundStyle(Color.black)
        .frame(width: 140, height: 210)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.grisBordure, lineWidth: 1)
        )
    }
}

#Preview {
    RewardSmallRectangleCardView(reward: rewards[10])
}
