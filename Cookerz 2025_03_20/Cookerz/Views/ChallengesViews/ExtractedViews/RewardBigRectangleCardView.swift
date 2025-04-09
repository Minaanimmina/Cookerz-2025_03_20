//
//  RewardBigRectangleCardView.swift
//  Cookerz
//
//  Created by apprenant87 on 12/03/2025.
//

import SwiftUI

struct RewardBigRectangleCardView: View {
    
    var reward: Reward
    
    @Binding var showAlert: Bool
    @State var isPurchased : Bool = false
    
    var body: some View {
        
        ZStack {
            VStack {
                ZStack {
                    HStack {
                        Text("\(reward.points)")
                            .font(.PoppinsCaption1Medium())
                        Image(.radishPoints)
                            .resizable()
                            .frame(width: 12, height: 15)
                            .rotationEffect(.degrees(180))
                            .scaleEffect(x: 1, y: -1)
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.grisBordure, lineWidth: 0.5)
                    )
                    .offset(y: -245)
                    .zIndex(1)
                    
                    VStack {
                        Image(reward.icon)
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 150)
                        
                        Text(reward.name)
                            .font(.PoppinsHeadline())
                            .multilineTextAlignment(.center)
                            .padding(.vertical, 20)
                            .padding(.horizontal, 10)
                        
                        
                        Text(reward.description)
                            .font(.PoppinsFootnoteLight())
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 10)
                            .lineLimit(...5)
                            .truncationMode(.tail)
                            .layoutPriority(1)
                    }
                    .padding(20)
                    .frame(width: 329, height: 490)
                    .background(Color.lightGreen)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .zIndex(0)
                }
                
                Button {
                    showAlert =  true
                    
                }label: {
                    
                    if isPurchased{
                        HStack {
                            Image("check")
                            Text("Récompense achetée")
                                .font(.PoppinsSubheadMedium())
                                .foregroundStyle(.black)
                                .frame(height: 40)
                        }
                    }else{
                        
                        Text("Acheter cette récompense")
                            .foregroundStyle(.white)
                            .font(.PoppinsSubheadMedium())
                            .padding()
                            .frame(maxWidth: 329)
                            .frame(height: 40)
                            .background(.red400)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        
                    }
                }
            }
            
            if showAlert {
                ZStack {
                    Color.black.opacity(0.5).ignoresSafeArea()
                    ReadyToBuy_View(reward: reward, showAlert: $showAlert, isPurchased: $isPurchased)
                }
            }
        }
    }
}

#Preview {
    RewardBigRectangleCardView(reward: rewards[0], showAlert : .constant(true))
}
