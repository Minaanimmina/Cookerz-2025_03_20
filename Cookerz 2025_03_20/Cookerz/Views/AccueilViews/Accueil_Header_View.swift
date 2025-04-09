//
//  Accueil_Header.swift
//  Cookerz
//
//  Created by Carole TREM on 11/03/2025.
//

import SwiftUI

struct Accueil_Header_View: View {
    @EnvironmentObject var baseViewModel: BaseViewModel
    var selectedTab: String
    var body: some View {
        
        if selectedTab == "Actualités" {
            
            HStack {
                NavigationLink (destination:ProfilPublicView())
                {
                    Image(baseViewModel.user.image)
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 50, height: 50)
                }
                VStack (alignment : .leading){
                    Text("Bonjour \(baseViewModel.user.name) 👋 !")
                        .font(.PoppinsTitle3Medium())
                    Text("On mange quoi aujourd'hui?")
                        .font(.PoppinsFootnote())
                        .foregroundStyle(.mediumGray)
                }
                Spacer()
                
                NavigationLink (destination: Accueil_notifications_View())
                {
                    ZStack {
                        Circle()
                            .stroke(style: StrokeStyle(lineWidth: 1))
                            .foregroundColor(.grisBordure)
                            .frame(width: 40, height: 40)
                        Image(systemName: "bell")
                            .foregroundStyle(.black)
                            .scaledToFit()
                    }.overlay(
                        ZStack {
                            Circle()
                                .frame(width: 23, height: 23)
                                .foregroundStyle(Color.red)
                            Text("\(notifications.count)")
                                .foregroundStyle(.white)
                                .font(.PoppinsSubhead())
                        }.offset(x: 15, y: -15))
                }
            }
            .padding(.horizontal, 24)
            
        }else {
            
            HStack {
                
                VStack (alignment : .leading){
                    Text("Rejoins les Cookerz")
                        .font(.PoppinsTitle3Medium())
                }
                Image("cookerz")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 55, height: 32)
                Spacer()
                
                NavigationLink (destination: Accueil_notifications_View())
                {
                    ZStack {
                        Circle()
                            .stroke(style: StrokeStyle(lineWidth: 1))
                            .foregroundColor(.grisBordure)
                            .frame(width: 40, height: 40)
                        Image(systemName: "bell")
                            .foregroundStyle(.black)
                            .scaledToFit()
                    }.overlay(
                        ZStack {
                            Circle()
                                .frame(width: 23, height: 23)
                                .foregroundStyle(Color.red)
                            Text("\(notifications.count)")
                                .font(.PoppinsSubhead())
                                .foregroundStyle(.white)
                        }.offset(x: 15, y: -15))
                }
            }
            .padding(.top, 5)
            .padding(.horizontal, 24)
        }
    }
}

#Preview {
    Accueil_Header_View(selectedTab: "Actualités")
        .environmentObject(BaseViewModel())
}
