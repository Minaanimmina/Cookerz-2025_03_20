//
//  Accueil_Ateliers.swift
//  Cookerz
//
//  Created by Carole TREM on 10/03/2025.
//

import SwiftUI

struct Accueil_Ateliers_View: View {
    
    @EnvironmentObject var baseViewModel: BaseViewModel
    
    @State var atelier: Atelier = ateliers [0]
    
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Ateliers en cours")
                    .font(.PoppinsTitle3Medium())
                    .padding(.bottom, 3)
                    .padding(.leading, 24)

                Ateliers_Encours_View(atelier: atelier)

                
                NavigationLink (destination: AtelierCreationView()) {
                    VStack {
                        Text("Crée ton atelier")
                            .foregroundStyle(.white)
                            .font(.PoppinsSubheadMedium())
                            .padding()
                            .frame(width: 345)
                            .frame(height: 40)
                            .background(.red400)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                    .padding(EdgeInsets(top: 18, leading: 24, bottom: 18, trailing: 0))
                }
                
                Text("Ateliers à venir")
                    .font(.PoppinsTitle3Medium())
                    .padding(.bottom, 3)
                    .padding(.leading, 24)
                
                VStack(spacing: 16) {
                    ForEach(ateliers) { atelier in
                        NavigationLink(destination : AtelierPageView(atelier: atelier))
                        {
                            Atelier_Card_View(atelier : atelier)
                        }
                    }
                }
                .foregroundStyle(Color.black)
                .padding(.trailing, 24)
                .padding(.leading, 24)

            }
        }
    }
}

#Preview {
    Accueil_Ateliers_View()
}
