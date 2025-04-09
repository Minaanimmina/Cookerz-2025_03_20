//
//  Accueil_actualités.swift
//  Cookerz
//
//  Created by Carole TREM on 10/03/2025.
//

import SwiftUI

struct Accueil_View: View {
    
    @EnvironmentObject var baseViewModel: BaseViewModel
    var tabs = ["Actualités", "Ateliers"]
    @State var selectedTab = "Actualités"
    @State var isChallenge : Bool = false
    
    
    func test() {
        for challenge in baseViewModel.user.listChallenges {
            print("baseViewModel user.listChallenge \(challenge.name) : \(challenge.challengeStatus)")
        }
        for challenge in baseViewModel.onGoingChallenges {
            print("baseViewModel user.onGoingChallenge \(challenge.name) : \(challenge.challengeStatus)")
        }
    }
    var body: some View {
        NavigationStack{
            VStack {
                
                Accueil_Header_View(selectedTab: selectedTab)
                
                VStack {
                    Picker_Accueil_View (selectedTab: $selectedTab, tabs: tabs)
                    
                    if selectedTab == "Actualités" {
                        Accueil_Actualités_View()
                    } else {
                        Accueil_Ateliers_View()
                    }
                }
                .foregroundStyle(Color.black)
            }
            .onAppear {
                selectedTab = "Actualités"
            }
        }
    }
}

#Preview {
    Accueil_View().environmentObject(BaseViewModel())
}
