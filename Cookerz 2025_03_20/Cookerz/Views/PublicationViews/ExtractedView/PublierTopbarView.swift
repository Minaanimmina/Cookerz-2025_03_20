//
//  publierTopbarView.swift
//  Cookerz
//
//  Created by Apprenant 85 on 11/03/2025.
//

import SwiftUI

struct PublierTopbarView: View {
    @Binding var selectedImage: String?
    @Binding var selectedTab: Int // Ajout du Binding pour la TabView

    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                goToAccueil()
                selectedImage = nil
            }) {
                Image(systemName: "xmark")
                    .foregroundColor(Color.white)
                    .font(.title)
                    .padding()
            }
            Spacer()

            Text("Nouvelle publication")
                .font(.PoppinsTitle3Medium())
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity, alignment: .center)
            

            Spacer()

            NavigationLink(destination: PublierOptionView(selectedImage: $selectedImage, selectedTab: $selectedTab)) {
                Text(selectedImage != nil ? "Suivant" : "Publier")
                    .font(.PoppinsCaption1Light())
                    .foregroundColor(.white)
                    .padding(.horizontal, 12.0)
                    .padding(.vertical, 5.0)
                    .frame(width: 70, height: 40)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .opacity(0.6)
                    )
            }
            .opacity(selectedImage != nil ? 1 : 0)
            .disabled(selectedImage == nil)

            Spacer()
        }
        .toolbar(.hidden, for: .tabBar)

    }

     func goToAccueil() {
        selectedTab = 0 // change l'onglet actif à "Accueil"
    }
}

struct PublierTopbarView_Previews: PreviewProvider {
    static var previews: some View {
        @State var selectedImage: String? = "exampleImage"
        @State var selectedTab: Int = 1
        
        return PublierTopbarView(selectedImage: $selectedImage, selectedTab: $selectedTab)
            .background(Color.black)
    }
}
