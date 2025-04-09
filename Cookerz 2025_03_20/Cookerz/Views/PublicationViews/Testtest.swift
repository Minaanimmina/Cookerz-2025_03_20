//
//  Testtest.swift
//  Cookerz
//
//  Created by Apprenant 85 on 18/03/2025.
//

import SwiftUI

struct Testtest: View {
    let galleryImages: [String] = ["pizza_margherita","salade_cesar", "gyozas", "pokebowl1-2", "pokebowl2-2", "pokebowl3-2", "pokebowl4", "toastegg", "ramen1", "salmonpasta", "sashimi", "risotto_champignons", "soupe_pho", "spaghetti_carbo"]
    
    let challenge: Challenge
    @State private var selectedImageName: String? = nil
    @EnvironmentObject var baseViewModel: BaseViewModel
    @Environment(\.presentationMode) var presentationMode // Permet de fermer la vue

    var body: some View {
        VStack {
            
            ZStack {
                Rectangle()
                    .fill(Color.grisFond.opacity(0.2))
                    .frame(width: 342, height: 342)
                    .overlay(
                        selectedImageName != nil ?
                            Image(selectedImageName!)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 342, height: 342)
                                .clipped()
                            : nil
                    )
                    .border(Color.gray.opacity(0.2), width: 1)
            }
            .padding(.bottom, 10)

            ScrollView {
                LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 3), spacing: 1) {
                    ForEach(galleryImages, id: \.self) { imageName in
                        Image(imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 130, height: 130)
                            .clipped()
                            .border(selectedImageName == imageName ? Color.blue : Color.clear, width: 3)
                            .onTapGesture {
                                selectedImageName = imageName
                            }
                    }
                }
            }

            if let selectedImageName = selectedImageName {
                Button("Publier le post") {
                    createPost(imageName: selectedImageName)
                    presentationMode.wrappedValue.dismiss()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background(Color.red400)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding()
            }
        }
    }

    private func createPost(imageName: String) {
        let nouveauPost = Post(
            creatorId: baseViewModel.user.id,
            title: challenge.name,
            image: imageName,
            date: Date(),
            level: challenge.level,
            likes: 0,
            durationHours: 0,
            durationMinutes: 0,
            isChallenge: true,
            challengeId: challenge.id
        )

        baseViewModel.postsVM.insert(nouveauPost, at: 0)
    }
}
