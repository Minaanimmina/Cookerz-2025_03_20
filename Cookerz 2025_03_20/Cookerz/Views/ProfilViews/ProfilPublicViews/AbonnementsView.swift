//  AbonnementsView.swift
//  Cookerz
//
//  Created by Apprenant 78 on 11/03/2025.
//

import SwiftUI

struct AbonnementsView: View {
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
                                .frame(width: 48, height: 48)
                                .clipShape(Circle())
                                .padding(.trailing, 12)
                            
                            VStack(alignment: .leading) {
                                Text(user.name)
                                    .font(.PoppinsFootnoteMedium())
                                Text(user.titleName)
                                    .font(.PoppinsCaption2())
                                    .foregroundStyle(Color.black.opacity(0.6))
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
            .padding(.leading, 24)
        }
        .onAppear {
            abonnementsMasques.removeAll()
        }
        Spacer()
    }
}

#Preview {
    AbonnementsView()
        .environmentObject(BaseViewModel())
}




