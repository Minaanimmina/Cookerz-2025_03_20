//
//  ProfilPriveMySubscriptionsView.swift
//  Cookerz
//
//  Created by apprenant87 on 17/03/2025.
//

import SwiftUI

struct ProfilPriveMySubscriptionsView: View {
    @EnvironmentObject var baseViewModel: BaseViewModel
    @State private var abonnementsMasques: Set<UUID> = []
    @State private var dragOffsets: [UUID: CGFloat] = [:]

    var body: some View {
        ScrollView {
            VStack {
                ForEach(baseViewModel.abonnements, id: \.id) { user in
                    if !abonnementsMasques.contains(user.id) {
                        HStack {
                            Image(user.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                                .padding(.trailing, 12)
                            
                            VStack(alignment: .leading) {
                                Text(user.name)
                                    .font(.PoppinsSubhead())
                                Text(user.titleName)
                                    .font(.PoppinsFootnoteLight()) .foregroundStyle(Color.black.opacity(0.6))
                            }
                            
                            Spacer()
                        }
                        .background(
                            ZStack {
                                if dragOffsets[user.id] ?? 0 < -100 {
                                    Color.red.opacity(0.5)
                                }
                            }
                        )
                        .cornerRadius(8)
                        .offset(x: dragOffsets[user.id] ?? 0)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    if value.translation.width < 0 {
                                        dragOffsets[user.id] = value.translation.width
                                    }
                                }
                                .onEnded { value in
                                    if dragOffsets[user.id] ?? 0 < -150 {
                                        abonnementsMasques.insert(user.id)
                                    }
                                    withAnimation {
                                        dragOffsets[user.id] = 0
                                    }
                                }
                        )
                        Divider()
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
            .padding(.top, 20)
            .padding(.horizontal, 24)
        }
        .onAppear {
            abonnementsMasques.removeAll()
        }
        Spacer()
    }
}

#Preview {
    ProfilPriveMySubscriptionsView()
        .environmentObject(BaseViewModel())
}
