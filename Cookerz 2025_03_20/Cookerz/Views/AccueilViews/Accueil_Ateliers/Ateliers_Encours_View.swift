//
//  Ateliers_Encours.swift
//  Cookerz
//
//  Created by Carole TREM on 11/03/2025.
//

import SwiftUI

struct Ateliers_Encours_View: View {
    
    var atelier : Atelier
    var ateliersEnCours : [Atelier] = [ateliers[4],ateliers[5],ateliers[2]]
    
    var body: some View {
        ScrollView (.horizontal, showsIndicators: false) {
            HStack (spacing: 10) {
                
                if !ateliersEnCours.isEmpty {
                    
                    ForEach (ateliersEnCours) { atelier in
                        
                        NavigationLink(destination: LiveSpectatorView()) {
                            VStack(alignment :.leading) {
                                ZStack {
                                    Image(atelier.image)
                                        .resizable()
                                        .scaledToFit()
                                        .cornerRadius(8)
                                        .frame(maxHeight: 90)
                                        .frame(maxWidth: 150)
                                        .opacity(0.8)
                                    Image("playLive")
                                }
                                Text(atelier.title)
                                    .font(.PoppinsCaption2())
                                    .foregroundStyle(Color.black)
                            }
                        }
                        
                    }
                } else {
                    Text("Pas d'ateliers en cours")
                        .font(.PoppinsCallout())
                        .foregroundColor(.mediumGray)
                }
            }
            .padding(.leading, 24)
        }
    }
}

#Preview {
    Ateliers_Encours_View(atelier : ateliers[0])
}


