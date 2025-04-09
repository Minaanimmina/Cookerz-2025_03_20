//
//  AutorisationGalery.swift
//  Cookerz
//
//  Created by Apprenant 85 on 19/03/2025.
//

import SwiftUI

struct GalleryPermissionView: View {
    @ObservedObject var viewModel: BaseViewModel  // Utilisation de @ObservedObject pour écouter les changements

    var body: some View {
        VStack {
            Text("Cette application nécessite l'accès à votre galerie.")
                .padding()
            Button("OK") {
                viewModel.isGalleryPermissionRequested = true // Lorsque l'utilisateur appuie sur OK, la valeur passe à true
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 10)
        .frame(width: 300, height: 200)
    }
}

#Preview {
    GalleryPermissionView(viewModel: BaseViewModel())
}
