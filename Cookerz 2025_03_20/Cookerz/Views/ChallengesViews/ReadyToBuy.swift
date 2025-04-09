//
//  ReadyToBuy.swift
//  Cookerz
//
//  Created by Carole TREM on 19/03/2025.
//

import SwiftUI

struct ReadyToBuy_View: View {
    
    @EnvironmentObject var baseViewModel: BaseViewModel
    
    var reward: Reward
    @Binding var showAlert: Bool
    @Binding var isPurchased : Bool
    
    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            Text("Veux-tu échanger")
                .font(.PoppinsTitle3Medium())
                .multilineTextAlignment(.center)
            
            HStack {
                HStack {
                    Text("\(reward.points)")
                        .font(.PoppinsCaption1Medium())
                        .foregroundColor(.black)
                    Image(.radishPoints)
                        .resizable()
                        .frame(width: 12, height: 15)
                        .rotationEffect(.degrees(180))
                        .scaleEffect(x: 1, y: -1)
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 6)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                )
                
                Text("?")
                    .font(.PoppinsTitle3Medium())
            }
            
            // Bouton "Oui"
            Button(action: {
                showAlert.toggle()
                isPurchased = true
                baseViewModel.toggleRewardUsed(reward: reward)
                
            }) {
                Text("Oui")
                    .frame(maxWidth: .infinity)
                    .font(.PoppinsSubheadMedium())
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
                    .background(Color.red400)
                    .cornerRadius(8)
            }.padding(.top)
            .frame(width: 220)
            
            // Bouton "Pas maintenant"
            Button(action: {
                showAlert = false
                }) {
                Text("Pas maintenant")
                    .font(.PoppinsSubheadMedium())
                    .foregroundColor(.black)
                    .underline()
            }
            .frame(width: 220, height: 40)
        }
        .padding(30)
        .frame(width: 260, alignment: .center)
        .background(Color.white)
        .cornerRadius(15)
    }
}

#Preview {
    ReadyToBuy_View(reward: rewards[0], showAlert: .constant(true),  isPurchased: .constant(false))
        .environmentObject(BaseViewModel())
}
