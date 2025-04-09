//
//  PhotoGalleryView.swift
//  Cookerz
//
//  Created by Apprenant 85 on 11/03/2025.
//

import SwiftUI

struct PhotoGalleryView: View {
    @Binding var selectedImage: String?
    let columns: [GridItem]
    let gallery: [String]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(gallery, id: \.self) { imageName in
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 131, height: 131)
                        .clipped()
                        .onTapGesture {
                            selectedImage = imageName
                        }
                }
            }
        }
    }
}


//avec aide de GPT
#Preview {
    struct PreviewWrapper: View {
        @State private var selectedImage: String? = nil

        let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]

        let gallery = ["gras1", "gras2", "pokebowl1-2", "pokebowl2-2"]

        var body: some View {
            PhotoGalleryView(selectedImage: $selectedImage, columns: columns, gallery: gallery)
        }
    }

    return PreviewWrapper()
}
