//
//  ProfilPublicNavigationView.swift
//  Cookerz
//
//  Created by apprenant87 on 17/03/2025.
//


import SwiftUI

struct ProfilPublicNavigationView: View {
    @EnvironmentObject var baseViewModel: BaseViewModel
    
    var body: some View {
        HStack(spacing: 5) {
            NavigationLink(destination: AbonnementsView()) {
                ProfilDetailsView(number: "\(baseViewModel.abonnements.count)", label: "Abonnés")
                    .foregroundColor(.black)
            }
            
            NavigationLink(destination: SuivisView()) {
                ProfilDetailsView(number: "\(baseViewModel.suivis.count)", label: "Suivis")
                    .foregroundColor(.black)
            }
            
            ProfilDetailsView(number: "\(baseViewModel.recipeCreatorUser.count)", label: "Recettes")
            
        }
    }
}

#Preview {
    ProfilPublicNavigationView()
        .environmentObject(BaseViewModel())
}
