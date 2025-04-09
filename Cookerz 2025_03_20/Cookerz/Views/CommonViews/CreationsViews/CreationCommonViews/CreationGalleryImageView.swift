//
//  CreationGalleryImageView.swift
//  Cookerz
//
//  Created by apprenant98 on 17/03/2025.
//


import SwiftUI

struct CreationGalleryImageView: View {
    @Binding var isGalleryPresented: Bool
    @Binding var imageChosen: String?
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    @State private var gallery: [String] = ["pizza_margherita","salade_cesar", "gyozas", "pokebowl1-2", "pokebowl2-2", "pokebowl3-2", "pokebowl4", "toastegg", "ramen1", "salmonpasta", "sashimi", "risotto_champignons", "soupe_pho", "spaghetti_carbo"]
    var body: some View {
        VStack {
            HStack {
                
                Button { isGalleryPresented = false
                }label: {
                    Text("Retour")
                        .foregroundStyle(Color.blue)
                }
                Spacer ()
                Text("Gallerie")
                    .foregroundStyle(Color.black)
                Spacer ()
                Text("Retour")
                    .foregroundStyle(.white)
                
            }
            .padding()
            .background(Color.grisFond.opacity(0.5))
            .cornerRadius(10)
            
            
            PhotoGalleryView(selectedImage: $imageChosen, columns: columns, gallery: gallery)
        }
    }
}
