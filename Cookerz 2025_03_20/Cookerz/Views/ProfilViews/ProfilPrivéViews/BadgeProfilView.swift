//
//  BadgeProfilView.swift
//  Cookerz
//
//  Created by Apprenant 78 on 18/03/2025.
//

import SwiftUI

struct BadgeView: View {
    var badge: Badge
    @EnvironmentObject var baseViewModel: BaseViewModel
    
    var body: some View {
        switch badge {
        case .newbie:
            Image("badge_newbie")
                .resizable()
                .scaledToFit()
                .frame(width: 28, height: 34)
        case .intermediaire:
            Image("badge_intermediate")
                .resizable()
                .scaledToFit()
                .frame(width: 28, height: 34)
        case .confirmed:
            Image("badge_confirmed")
                .resizable()
                .scaledToFit()
                .frame(width: 28, height: 34)
        default:
            EmptyView()
        }
    }
}

#Preview {
    BadgeView(badge: .newbie) 
}

