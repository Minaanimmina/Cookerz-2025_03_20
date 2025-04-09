//
//  LiveSpectatorView.swift
//  Cookerz
//
//  Created by Apprenant 85 on 17/03/2025.
//

import SwiftUI

struct LiveSpectatorView: View {
    @EnvironmentObject var baseViewModel: BaseViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State private var message: String = ""

    
    
    var body: some View {
        VStack{

            ZStack {
                Image("livecamera")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea(edges: .all)
                
                
                HStack{
                    
                    
                    Image(baseViewModel.usersVM[4].image)
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 40, height: 40)
                        .padding(.leading, 20)

                    Text("\(baseViewModel.usersVM[4].name)")
                        .foregroundColor(Color.white)
                        .font(.PoppinsTitle3Medium())
                        .padding()
                    
                    Spacer()
                    HStack{ // HStack pour aligner le point et le texte
                        Image(systemName: "person.fill")
                            .foregroundColor(Color.white)
                            .font(.PoppinsTitle3Medium())
                        
                        Text("18")
                            .foregroundColor(Color.white)
                            .font(.PoppinsTitle3Medium())
                            .padding(.trailing, 24)
                            .foregroundColor(Color.white)
                        
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }
                        ) {
                            Image(systemName: "xmark")
                                .foregroundColor(Color.white)
                                .font(.title)
                                .padding()
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(maxHeight: 780, alignment: .top)
                
                Spacer()
                
                HStack {
                    TextField("Envoyer un message...", text: $message)
                        .padding(12)
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(25)
                        .foregroundColor(.white)
                        .disableAutocorrection(true) // Désactive la correction auto

                    Button(action: {
                        
                    }) {
                        Image(systemName: "paperplane.fill")
                            .foregroundColor(.white)
                            .padding(8)
                    }
                }
                .frame(maxHeight: .infinity, alignment: .bottom)
                .padding(.horizontal)
                .padding(.bottom, 60)

                
                
                
                
                
            }
        }
        .toolbar(.hidden, for : .tabBar)
        .toolbar(.hidden, for : .navigationBar)

    }
}

#Preview {
    LiveSpectatorView()
        .environmentObject(BaseViewModel())
}
