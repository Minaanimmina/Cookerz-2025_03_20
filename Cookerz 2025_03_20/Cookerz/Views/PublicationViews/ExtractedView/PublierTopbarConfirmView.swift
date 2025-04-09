//
//  PublierTopbarView 2.swift
//  Cookerz
//
//  Created by Apprenant 85 on 11/03/2025.
//
import SwiftUI

struct PublierTopbarConfirmView: View {
    @EnvironmentObject var baseViewModel: BaseViewModel
    @Binding var selectedImage: String?
    @Binding var text: String
    @Binding var numberofflame: Int
    @Binding var PublicationTimeHours: Int
    @Binding var PublicationTimeMinutes: Int
    @Binding var selectedTab: Int
    @State private var showAlert = false
    @State private var alertMessage = ""

    @Environment(\.presentationMode) var presentationMode
    func goToAccueil() {
       selectedTab = 0 // change l'onglet actif à "Accueil"
   }
    var body: some View {
        HStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark")
                    .foregroundColor(Color.black)
                    .font(.title)
                    .padding()
            }
            
            Spacer()
            
            Text("Nouvelle publication")
                .font(.PoppinsTitle3Medium())
                .foregroundColor(Color.black)
                .frame(maxWidth: .infinity, alignment: .center)
            
            Spacer()
            
            Button(action: {
                if selectedImage == nil || text.isEmpty || numberofflame == 0 || (PublicationTimeHours == 0 && PublicationTimeMinutes == 0) {
                    alertMessage = "Veuillez ajouter un titre et choisir une durée"
                    showAlert = true
                } else {
                    ajouterPost()
                    goToAccueil()
                    selectedImage = nil
                }
            }) {
                Text("Publier")
                    .font(.PoppinsCaption1Light())
                    .foregroundColor(.black)
                    .padding(.horizontal, 12.0)
                    .padding(.vertical, 5.0)
                    .frame(width: 70, height: 40)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color("red-50"))
                    )
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Champs incomplets"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }


            
            Spacer()
        }
        
    }

    func ajouterPost() {
        guard let imageName = selectedImage, !text.isEmpty else {
            print("⚠️ Impossible d'ajouter un post : titre ou image manquant.")
            return
        }

        let level: Level = {
            switch numberofflame {
            case 1: return .easy
            case 2: return .medium
            case 3: return .hard
            default: return .easy
            }
        }()

        let nouveauPost = Post(
            creatorId: users[0].id,
            title: text,
            image: imageName,
            date: Date(),
            level: level,
            likes: 0,
            durationHours: PublicationTimeHours,
            durationMinutes: PublicationTimeMinutes,
            isChallenge: false,
            challengeId: nil
        )

        baseViewModel.postsVM.insert(nouveauPost, at: 0)

        // Réinitialisation des champs après publication
        text = ""
        selectedImage = nil
        numberofflame = 1
        PublicationTimeHours = 0
        PublicationTimeMinutes = 0

        presentationMode.wrappedValue.dismiss()
    }
}
