//
//  FollowUserButtonView.swift
//  Cookerz
//
//  Created by apprenant87 on 17/03/2025.
//


import SwiftUI

struct FollowUserButtonView: View {
    @EnvironmentObject var baseViewModel: BaseViewModel
    var user: User

    var body: some View {
        Button(action: {
            ButtonFollowStatus(for: user.id)
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(baseViewModel.user.listFollowedId.contains(user.id) ? Color.gray.opacity(0.7) : Color.red300)
                    .frame(width: 220, height: 40)
                
                HStack {
                    Text(baseViewModel.user.listFollowedId.contains(user.id) ? "Se Désabonner" : "S'abonner")
                        .font(.PoppinsFootnoteMedium())
                        .foregroundColor(.white)
                }
            }
        }
    }

    func ButtonFollowStatus(for userId: UUID) {
        if baseViewModel.user.listFollowedId.contains(userId) {
            baseViewModel.user.listFollowedId.removeAll { $0 == userId }
        } else {
            baseViewModel.user.listFollowedId.append(userId)
        }
    }
}

#Preview {
    FollowUserButtonView(user: julien)
        .environmentObject(BaseViewModel())
}




//import SwiftUI
//
//struct FollowUserButtonView: View {
//    @EnvironmentObject var baseViewModel: BaseViewModel
//
//    var body: some View {
//        Button(action: {
//            ButtonFollowStatus()
//        }) {
//            ZStack {
//                RoundedRectangle(cornerRadius: 8)
//                    .fill(baseViewModel.user.listFollowedId.contains(baseViewModel.user.id) ? Color.gray.opacity(0.7) : Color.red300)  
//                    .frame(width: 211, height: 40)
//                
//                HStack {
//
//                    Text(baseViewModel.user.listFollowedId.contains(baseViewModel.user.id) ? "Se Désabonner" : "S'abonner")
//                        .font(.PoppinsFootnoteMedium())
//                        .foregroundColor(.white)
//                }
//            }
//        }
//
//    }
//
//    func ButtonFollowStatus() {
//        if baseViewModel.user.listFollowedId.contains(baseViewModel.user.id) {
//            baseViewModel.user.listFollowedId.removeAll { $0 == baseViewModel.user.id }
//        } else {
//            baseViewModel.user.listFollowedId.append(baseViewModel.user.id)
//        }
//    }
//
//
//}
//
//#Preview {
//    FollowUserButtonView()
//        .environmentObject(BaseViewModel())
//}
