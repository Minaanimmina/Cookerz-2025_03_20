//
//  ChallengeBigRectangleCardView.swift
//  Cookerz
//
//  Created by apprenant87 on 11/03/2025.
//

import SwiftUI

struct ChallengeBigRectangleCardView: View {
    var galleryImages: [String] = ["pizza_margherita","salade_cesar", "gyozas", "pokebowl1-2", "pokebowl2-2", "pokebowl3-2", "pokebowl4", "toastegg", "ramen1", "salmonpasta", "sashimi", "risotto_champignons", "soupe_pho", "spaghetti_carbo"]
    
    @State private var showgalery: Bool = false
    @State private var selectedImageName: String? = nil
    
    @EnvironmentObject var baseViewModel: BaseViewModel
    
    var challenge: Challenge
    
    var challengeStatus: ChallengeStatus {
        if let index = baseViewModel.user.listChallenges.firstIndex(where: { $0.id == challenge.id}) {
            return baseViewModel.user.listChallenges[index].challengeStatus
        } else {
            return .isNotStarted
        }
    }
    
    var body: some View {
        ZStack {
            
            
            VStack {
                ZStack {
                    VStack {
                        // TODO: extractedview lvl défi
                        HStack {
                            Text(challenge.level.name)
                                .font(.PoppinsSubheadMedium())
                                .foregroundStyle(.black)
                                .foregroundColor(.black)
                            Image(challenge.level.IconColor)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 20)
                        }
                        .padding(8)
                        .background(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.grisBordure, lineWidth: 0.5)
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .offset(y: 25)
                        .zIndex(1)
                        
                        VStack {
                            Image(challenge.icon)
                                .resizable()
                                .scaledToFit()
                                .frame(maxHeight: 90)
                                .padding(.bottom, 12)
                            
                            Text(challenge.name)
                                .font(.PoppinsBodyMedium())
                                .foregroundStyle(.black)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: 298)
                            
                            // call ChallengesPointView
                            ChallengesPointView(challenge: challenge, bgColor: .white)
                            
                            Text("Pense à partager ta recette ou à poster une photo quand tu as terminé !")
                                .font(.PoppinsCaption1())
                                .foregroundStyle(.black)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: 250)
                                .padding(.vertical, 12)
                            
                            Text(challenge.description)
                                .font(.PoppinsCaption1())
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: 250)
                        }
                        .padding(.vertical, 15)
                        .padding(.top, 20)
                        .padding(.bottom, 15)
                        .frame(width: 329, height: 410)
                        .background(
                            // Condition pour changer la couleur de fond
                            challengeStatus == .isNotStarted ? Color.red50 :
                                challengeStatus == .onGoing ? Color.brightYellow100 :
                                Color.lightGreen
                        )                    .clipShape(RoundedRectangle(cornerRadius: 20))
                            .zIndex(0)
                    }
                }
                
                // TODO: code bouton -> passe en "défis en cours"
                
                Button {
                    
                    baseViewModel.challengeStatusToggle(challenge : challenge)
                    
                }label : {
                    
                    if challengeStatus == .isNotStarted{
                        Text("Participer au défi")
                            .foregroundStyle(.white)
                            .font(.PoppinsSubheadMedium())
                            .padding()
                            .frame(maxWidth: 329)
                            .frame(height: 40)
                            .background(Color.red400)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        
                    } else if challengeStatus == .onGoing {
                        HStack {
                            Text("Valider le défi")
                                .foregroundStyle(.white)
                                .font(.PoppinsSubheadMedium())
                                .padding()
                                .frame(maxWidth: 329)
                                .frame(height: 40)
                                .background(Color.greenValidate)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                    }else {
                        
                        HStack {
                            Image("check")
                            Text("Défi validé")
                                .font(.PoppinsSubheadMedium())
                                .foregroundStyle(.black)
                                .frame(height: 40)
                        }

                    }
                    
                    
                    
                }
                
                if challengeStatus == .isFinished {
                    NavigationLink(destination: Testtest(challenge: challenge)) {
                        Text("Prendre une photo")
                            .foregroundStyle(.white)
                            .font(.PoppinsSubheadMedium())
                            .padding()
                            .frame(maxWidth: 329)
                            .frame(height: 40)
                            .background(Color.red400)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
  .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .padding(.horizontal, 24)
            
            Spacer()
            if showgalery {
                ScrollView {

                LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 3), spacing: 1) {
                    ForEach(galleryImages, id: \.self) { imageName in
                        Image(imageName)
                        
                            .resizable()
                            .scaledToFill()
                            .frame(width: 131, height: 131)
                        
                            .clipped()
                            .onTapGesture {
                                selectedImageName = imageName
                                
                            }}
                    }
                }            .padding(.top, 500) // Décalage supplémentaire vers le bas

            }
        }
    }


#Preview {
    ChallengeBigRectangleCardView(challenge: challenge3)
        .environmentObject(BaseViewModel())
}
