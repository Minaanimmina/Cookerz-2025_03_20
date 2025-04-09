//
//  ProfilPriveView.swift
//  Cookerz
//
//  Created by Apprenant 78 on 11/03/2025.
//

import SwiftUI

struct ProfilPriveView: View {
    @EnvironmentObject var baseViewModel: BaseViewModel
    
    var tabs = ["Mes recettes", "Mes défis", "Mes abos"]
    @State var selectedTabProfilPrive = "Mes recettes"
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Image(baseViewModel.user.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 94, height: 94)
                        .clipShape(Circle())
                        .padding(.top, 10)
                    
                    HStack {
                        Text(baseViewModel.user.name)
                            .font(.PoppinsHeadlineMedium())
                        
                        
                        BadgeView(badge: baseViewModel.badgesGained)
                        // ancien badge
//                        Image("badge_newbie")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 28, height: 34)
                    }
                    .padding(.bottom, 16)
                    
                    // segmented Picker
                    Picker_Accueil_View (selectedTab: $selectedTabProfilPrive, tabs: tabs)
                        .padding(.bottom, 20)
                    
                    if selectedTabProfilPrive == "Mes recettes" {
                        ProfilPriveMyRecipesView()
                    } else if selectedTabProfilPrive == "Mes défis" {
                        ProfilPriveMyChallengesView()
                    } else {
                        ProfilPriveMySubscriptionsView()
                    }
                }
                .onAppear {
                    selectedTabProfilPrive = "Mes recettes"
                }
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        NavigationLink(destination: SettingsView()) {
                            Image(systemName: "gearshape")
                                .font(.title3)
                        }
                    }
                    ToolbarItem(placement: .principal) {
                        Text("Profil")
                            .font(.PoppinsTitle3Medium())
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        TotalUserPointsView()
                    }
                }.navigationBarTitleDisplayMode(.inline)

            }
            
        }
    }
    
}

#Preview {
    ProfilPriveView()
        .environmentObject(BaseViewModel())
}
