//
//  PhotoSelectionView.swift
//  Cookerz
//
//  Created by Apprenant 85 on 11/03/2025.
//

import SwiftUI

struct PhotoSelectionView: View {
    @Binding var selectedImage: String?
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Rectangle()
            .frame(width: 342, height: 342)
            .foregroundColor(.black)
            .overlay(
                Button(action: {
                    selectedImage = nil
                    presentationMode.wrappedValue.dismiss()

                }) {
                    Group {
                        if let imageName = selectedImage {
                            Image(imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 342, height: 342)
                                .clipped(antialiased: true)
                        } else {
                            Text("Sélectionnez une image")
                                .font(.PoppinsCalloutLight())
                                .foregroundColor(.white)
                        }
                    }
                }
            )
    }
}



//Avec aide de GPT
#Preview {
    struct PreviewWrapper: View {
        @State private var selectedImage: String? = nil

        var body: some View {
            PhotoSelectionView(selectedImage: $selectedImage)
        }
    }

    return PreviewWrapper()
}
