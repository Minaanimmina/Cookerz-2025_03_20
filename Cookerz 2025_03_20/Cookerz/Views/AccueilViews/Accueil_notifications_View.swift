//
//  Accueil_notifications.swift
//  Cookerz
//
//  Created by Carole TREM on 10/03/2025.
//

import SwiftUI

struct Accueil_notifications_View: View {
    
    @EnvironmentObject var baseViewModel: BaseViewModel
    
    var body: some View {
        
        NavigationStack {
            VStack{
                //            Text("Notifications")
                //                .font(.PoppinsTitle3Medium())
                
                ScrollView {
                    VStack  (alignment :.leading) {
                        ForEach (notifications) { notification in
                            
                            let user : User? = baseViewModel.usersVM.first(where: { $0.id == notification.userSenderID })
                            let challenge : Challenge? = challenges.first(where: { $0.id == notification.subjectID })
                            let atelier : Atelier? = baseViewModel.ateliersVM.first(where: { $0.id == notification.subjectID})
                            
                            HStack {
                                Image(notification.type.image(userImage : user?.image, challengeImage : challenge?.icon) ?? "")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                VStack (alignment : .leading) {
                                    Text(notification.type.description(nameUser : user?.name, nameChallenge : challenge?.name, nameAtelier : atelier?.title))
                                        .font(.PoppinsFootnoteMedium())
                                    Text(notification.date.timeAgo())
                                        .font(.PoppinsCaption2())
                                        .foregroundColor(.mediumGray)
                                }
                            }.padding()
                                .frame(height: 60)
                            
                            Divider().background(Color.mediumGray)
                                .frame(width : 320, height : 0.5)
                                .padding(.horizontal, 30)
                        }
                        
                    }
                    Spacer()
                }
            }            .toolbar {
                
                ToolbarItem(placement: .principal) {
                    Text("Notifications")
                        .font(.PoppinsTitle3Medium())
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    Accueil_notifications_View()
        .environmentObject(BaseViewModel())
}
