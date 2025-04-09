//
//  TotalUserPointsView.swift
//  Cookerz
//
//  Created by apprenant87 on 12/03/2025.
//


import SwiftUI

struct TotalUserPointsView: View{
    @EnvironmentObject var baseViewModel: BaseViewModel
    
    var body: some View {
        HStack {
            Text("\(baseViewModel.currentPoints)")
                .font(.PoppinsSubheadMedium())
            Image(.radishPoints)
                .resizable()
                .frame(width: 12, height: 15)
                .scaledToFit()
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 8)
        .background(Color.grisBordure)
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}
