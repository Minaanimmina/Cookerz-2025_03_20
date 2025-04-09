//
//  Publierview.swift
//  Cookerz
//
//  Created by Apprenant 85 on 10/03/2025.
//

import SwiftUI

struct PublierView: View {
    @State private var selectedImage: String? = nil
    @State private var selectedOption = "Publier"
    @State private var showCamera = false
    @State private var capturedImage: UIImage?
    @Binding var selectedTab: Int
    @StateObject var viewModel = BaseViewModel()

    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State private var gallery: [String] = ["pizza_margherita","salade_cesar", "gyozas", "pokebowl1-2", "pokebowl2-2", "pokebowl3-2", "pokebowl4", "toastegg", "ramen1", "salmonpasta", "sashimi", "risotto_champignons", "soupe_pho", "spaghetti_carbo"]

    
    
    var body: some View {
        NavigationView {
            ZStack{
                
                if !viewModel.isGalleryPermissionRequested {
                                GalleryPermissionView(viewModel: viewModel)
                                    .zIndex(1)
                            }
                Color.black.edgesIgnoringSafeArea(.all)
                    .toolbar(.hidden, for : .tabBar)

                if selectedOption == "Publier"{
                    
                    
                    VStack{
                        PublierTopbarView(selectedImage: $selectedImage,selectedTab: $selectedTab)
                        
                        PhotoSelectionView(selectedImage: $selectedImage)
                        
                        
                        if viewModel.isGalleryPermissionRequested {
                            HStack {
                                
                                Spacer()
                                Button(action: {
                                    showCamera = true
                                }) {
                                    Image(systemName: "camera.fill")
                                        .font(.callout)
                                        .padding()
                                        .background(Color("red-400"))
                                        .foregroundColor(.white)
                                        .clipShape(Circle())
                                }
                            }
                        }
                        
                        if viewModel.isGalleryPermissionRequested{
                            PhotoGalleryView(selectedImage: $selectedImage, columns: columns, gallery: gallery)
                            
                                .fullScreenCover(isPresented: $showCamera) {
                                    CameraView(selectedOption: $selectedOption, image: $capturedImage, onSave: { imageName in
                                        gallery.append(imageName) // Ajoute l'image au tableau
                                    })
                                    .edgesIgnoringSafeArea(.all)
                                }
                        } else {
                            Spacer()
                        }
                    }
                }
                if selectedOption == "Live"{
                    LiveView(selectedOption: $selectedOption)
                    
                }
            }
            .overlay(
                VStack {
                    Spacer()
                    
                    HStack {
                        Text("Publier")
                            .foregroundColor(selectedOption == "Publier" ? .black : .white)
                            .padding(10)
                            .frame(maxWidth: .infinity)
                            .background(selectedOption == "Publier" ? Color.white : Color.clear)
                            .cornerRadius(8)
                            .contentShape(Rectangle()) // rend tout l’espace cliquable
                            .onTapGesture {
                                selectedOption = "Publier"
                            }

                        Text("Live")
                            .foregroundColor(selectedOption == "Live" ? .black : .white)
                            .padding(10)
                            .frame(maxWidth: .infinity)
                            .background(selectedOption == "Live" ? Color.white : Color.clear)
                            .cornerRadius(8)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                selectedOption = "Live"
                            }
                    }
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color.black))
                    .padding(.horizontal, 20)
                    .padding(.bottom, selectedOption == "Publier" ? 10 : 100)


                }
                .frame(width: 354, height: 44),
                alignment: .bottom
            )
        }
        
            }
        }
    

struct PublierView_Previews: PreviewProvider {
    static var previews: some View {
        PublierView(selectedTab: .constant(0))
            .environmentObject(BaseViewModel())
    }
}



import UIKit

struct CameraView: UIViewControllerRepresentable {
    @Binding var selectedOption: String
    @Binding var image: UIImage?  // Stocke temporairement l’image capturée
    var onSave: (String) -> Void  // Closure qui sera appelée après l’enregistrement
    @Environment(\.presentationMode) private var presentationMode  // Pour fermer la caméra après la capture

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: CameraView

        init(parent: CameraView) {
            self.parent = parent
        }

        // Fonction appelée quand une image est sélectionnée (prise avec l’appareil photo)
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImage = info[.originalImage] as? UIImage {
                
                // ➜ Étape 1 : Enregistrer l’image dans le stockage local
                let imageName = saveImageToDocuments(image: selectedImage)
                
                // ➜ Étape 2 : Passer le nom de l’image à `onSave` pour l’ajouter dans `gallery`
                parent.onSave(imageName)
            }

            // ➜ Étape 3 : Fermer la caméra
            parent.presentationMode.wrappedValue.dismiss()
        }

        // Fonction appelée si l'utilisateur annule la prise de photo
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            // ➜ Lorsque l'utilisateur annule, définir `selectedOption` à "publier"
            parent.selectedOption = "Publier"

            
            parent.presentationMode.wrappedValue.dismiss()  // ➜ Ferme la caméra
        }

        // Fonction qui enregistre l’image dans le dossier Documents
        func saveImageToDocuments(image: UIImage) -> String {
            let fileName = "photo_\(UUID().uuidString).jpg"  // ➜ Crée un nom unique pour l’image
            
            if let data = image.jpegData(compressionQuality: 0.8) {  // ➜ Convertit l’image en format JPEG
                let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent(fileName)  // ➜ Définit l’emplacement de sauvegarde
                try? data.write(to: url)  // ➜ Écrit l’image dans le fichier
            }

            return fileName  // ➜ Retourne le nom de l’image pour l’ajouter dans `gallery`
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .camera  // ➜ Active l’appareil photo
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}
