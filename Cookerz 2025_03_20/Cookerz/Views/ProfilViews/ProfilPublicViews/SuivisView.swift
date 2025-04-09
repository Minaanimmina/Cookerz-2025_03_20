//
//  SuivisView.swift
//  Cookerz
//
//  Created by Apprenant 78 on 11/03/2025.
//

import SwiftUI

struct SuivisView: View {
    @EnvironmentObject var baseViewModel: BaseViewModel
    @State private var utilisateursMasques: Set<UUID> = []
    @State private var dragOffsets: [UUID: CGFloat] = [:] // Un dictionnaire qui contient l'offset de chaque profil (c'est-à-dire le décalage horizontal lors du glissement).

    var body: some View {
        ScrollView {
            VStack (alignment: .leading){
                ForEach(baseViewModel.suivis, id: \.id) { user in
                    if !utilisateursMasques.contains(user.id) {
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
                                if dragOffsets[user.id] ?? 0 < -100 {  // si l'offset horizontal du user dépasse une certaine valeur (-100), un arrière-plan rouge s'affiche pour indiquer que le user est prêt à être "masqué"
                                    Color.red100
                                }
                            }
                        )
                        .cornerRadius(8)
                        .offset(x: dragOffsets[user.id] ?? 0) // applique le décalage horizontal pour un effet de glissement.Aucun décalage = 0
                        .gesture(
                            DragGesture() // geste de glissement est appliqué à chaque utilisateur
                                
                                .onChanged { value in  // user déplace son doigt, mise à jour dragOffsets pour déplacer le profil en fonction du glissement.
                                    if value.translation.width < 0 {
                                        dragOffsets[user.id] = value.translation.width
                                    }
                                }
                                .onEnded { value in // user termine son glissement
                                    if dragOffsets[user.id] ?? 0 < -150 { // Glissement suffisant pour masquer
                                        utilisateursMasques.insert(user.id) // Masquer l'utilisateur
                                    }
                                    withAnimation {
                                      dragOffsets[user.id] = 0 // + propre , pas de bugue
                                     }
                                }
                        )
                        .onAppear {
                            dragOffsets[user.id] = 0
                        }
                        
                        Divider()
                            .frame(maxWidth: .infinity, alignment: .leading)

                    }
                }
            }
            .padding(.top, 20)
            .padding(.leading, 24)
            Spacer()        }
    }
}

#Preview {
    SuivisView()
        .environmentObject(BaseViewModel())
}
