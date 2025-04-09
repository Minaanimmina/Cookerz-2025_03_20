//
//  chatroom.swift
//  Cookerz
//
//  Created by Apprenant 85 on 17/03/2025.
//

import SwiftUI

struct LiveChatView: View {
    @State private var message: String = ""
    @State private var messages: [String] = [
        "Alex: Wow, trop cool !",
        "Emma: J'adore 🔥",
        "Lucas: Quel moment incroyable !",
        "Sophie: Continue comme ça ! 💯"
    ]
    
    @Namespace private var bottomID // Pour l'auto-scroll

    var body: some View {
        VStack {
            
            ZStack {
                Text("Chat")
                    .foregroundColor(.white)
                    .font(.headline)

                HStack {
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .font(.title)
                        .padding()
                    
                    Spacer() // Pousse tout à droite pour équilibrer
                }
            }
            .frame(maxWidth: .infinity, alignment: .top)

            // Liste des messages (scrollview extensible)
            ScrollViewReader { proxy in
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(messages, id: \.self) { msg in
                            Text(msg)
                                .foregroundColor(.white)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(Color.white.opacity(0.2))
                                .cornerRadius(15)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        Text("") // Élément invisible pour l'auto-scroll
                            .id(bottomID)
                    }
                    .padding()
                }
                .onChange(of: messages.count) { _ in
                    // Scroll automatique vers le dernier message
                    withAnimation {
                        proxy.scrollTo(bottomID, anchor: .bottom)
                    }
                }
            }

            Spacer()

            // Champ d'envoi de message
            HStack {
                TextField("Envoyer un message...", text: $message)
                    .padding(12)
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(25)
                    .foregroundColor(.white)
                    .disableAutocorrection(true) // Désactive la correction auto

                Button(action: {
                    if !message.isEmpty {
                        withAnimation {
                            messages.append("Moi: \(message)") // Ajoute le message
                        }
                        message = "" // Réinitialise le champ
                    }
                }) {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.white)
                        .padding(8)
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .background(Color.black.opacity(0.8).ignoresSafeArea()) // Fond sombre façon Insta Live
    }
}

struct ContentView: View {
    var body: some View {
        LiveChatView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
