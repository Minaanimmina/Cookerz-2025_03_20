//
//  TabBarView.swift
//  Cookerz
//
//  Created by Emilie on 10/03/2025.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectedTab: Int = 0
    @EnvironmentObject var baseViewModel: BaseViewModel

    var body: some View {
        TabView(selection: $selectedTab) {
            
            Accueil_View()
                .tabItem {
                    Label("Accueil", image: "tabBar_accueil")
                }
                .tag(0)

            RecipesView()
                .tabItem {
                    Label("Recettes", image: "tabBar_recette")
                }
                .tag(1)

            PublierView(selectedTab: $selectedTab)
                .tabItem {
                    Label("Publier", image: "tabBar_publier")
                }
                .tag(2)

            ChallengesView()
                .tabItem {
                    Label("Défis", image: "tabBar_defis")
                }
                .tag(3)

            ProfilPriveView()
                .tabItem {
                    Label("Profil", image: "tabBar_profil")
                }
                .tag(4)
        }
    }
}

#Preview {
    TabBarView()
        .environmentObject(BaseViewModel())
}
