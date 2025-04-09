//
//  Atelier_Detail.swift
//  Cookerz
//
//  Created by Carole TREM on 11/03/2025.
//

import SwiftUI

struct Atelier_Card_View: View {
    
    @State var atelier : Atelier
    @State var isRegistered: Bool = false
    
    var atelierCreator: User? {
        for user in users {
            if user.id == atelier.creatorId {
                return user
            }
        }
        return nil
    }
    
    var nbUsersRegistered: Int {
        return atelier.usersRegistered.count
    }
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text(atelier.title)
                    .font(.PoppinsBodyMedium())
                    .foregroundColor(.black)
                Text(atelier.date.toString())
                    .font(.PoppinsFootnote())
                    .foregroundColor(Color.black.opacity(0.6))
            }
            .frame(maxWidth: 313, alignment: .leading)
            .padding(.bottom, 10)
            
            HStack {
                Button {
                    atelier.usersRegistered.append(users[0].id)
                    isRegistered = true
                } label: {
                    if isRegistered {
                        HStack {
                            Image("check")
                            Text("Inscrit.e à l'atelier")
                                .font(.PoppinsSubheadMedium())
                                .foregroundStyle(.black)
                                .frame(height: 40)
                        }
                    } else {
                        Text("S'inscrire à l'atelier")
                            .foregroundStyle(Color.red400)
                            .font(.PoppinsSubheadMedium())
                            .frame(width: 313, height: 40)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.red400, lineWidth: 2))
                    }
                }
                .disabled(isRegistered)
            }
            .padding(.bottom, 14)
            
            HStack {
                Image(atelierCreator?.image ?? "Joseph")
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 32, height: 32)
                
                Text(atelierCreator?.name ?? "Joseph")
                    .font(.PoppinsFootnote())
                
                Spacer()
                
                ZStack {
                    HStack {
                        Image("nb_participants")
                        Text("\(nbUsersRegistered) / \(atelier.nbSeats)")
                            .font(.PoppinsFootnote())
                    }
                    .foregroundColor(.black)
                    .padding(6)
                    .background(Color.red50)
                    .cornerRadius(8)
                }
            }
        }
        .padding(16)
        .frame(width: 345, height: 180)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.grisBordure, lineWidth: 1))
    }
}

#Preview {
    Atelier_Card_View(atelier : ateliers[0])
}
