//
//  LiveView.swift
//  Cookerz
//
//  Created by Apprenant 85 on 10/03/2025.
//

import SwiftUI

struct LiveView: View {
    @Binding var selectedOption : String
    @State var isLive : Bool = false
    @State private var isVisible = true
    @State private var showAlert : Bool = false
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        
        VStack{
            ZStack {
                Image("livecamera")
                    .resizable()
                    .scaledToFill() 
                    
                
                HStack{
                    Button(action: {
                        if isLive {
                            isLive = false}
                        else {
                            selectedOption = "Publier"
                            presentationMode.wrappedValue.dismiss()
                        }
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(Color.white)
                            .font(.title)
                            .padding()
                        
                    }
                    Spacer()
                    if isLive {
                        HStack(spacing: 8) {
                            Circle()
                                .fill(Color.red) 
                                .frame(width: 10, height: 10)
                            Text("LIVE")
                                .foregroundColor(Color.white)
                                .font(.PoppinsTitle3Medium())
                                .padding(.trailing, 24)
                                .foregroundColor(Color.white)
                               
                                
                        }
                    }}
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .frame(maxHeight: .infinity, alignment: .top)
                                .padding(.top, 47)
                                .padding(.leading, 8)
                
                if showAlert {
                    
                    
                    VStack(alignment: .center) {
                        Text("Prêt(e) à \ncommencer \nl'atelier ?")
                            .font(.PoppinsTitle3Medium())
                            .multilineTextAlignment(.center)
                        
                        
                        // 1er bouton
                        Button(action:{
                            isLive = true
                            showAlert.toggle()
                        }) {
                            Text("Lancer le live")
                                .font(.PoppinsSubheadMedium())
                                .foregroundColor(.white)
                                .frame(width: 220, height: 40)
                                .background(Color.red400)
                                .cornerRadius(8)
                        }
                        
                        // 2nd bouton
                        Button(action:{
                            isLive = false
                            showAlert.toggle()
                        }) {
                            Text("Pas maintenant")
                                .font(.PoppinsSubheadMedium())
                                .foregroundColor(.black)
                                .underline()
                                .frame(width: 220, height: 40)
                                .cornerRadius(8)
                        }
                    }
                    
                    .padding(20)
                    .frame(width: 260, alignment: .center)
                    .background(.white)
                    .cornerRadius(15)
                }
                
                
                if !isLive {
                    
                    VStack{
                        Spacer()
                        Button(action: {
                            if !isLive {
                                showAlert = true
                            } else {
                                isLive = false
                            }
                            
                        }) {
                            ZStack{
                                Circle()
                                    .fill(Color.clear.opacity(0.8))
                                    .frame(width: 80, height: 80)
                                    .overlay(
                                        Circle()
                                            .stroke(Color.white, lineWidth: 4))
                                Circle()
                                    .fill(Color.white.opacity(0.8))
                                    .frame(width: 70, height: 70)
                            }
                                
                        }.padding(.bottom, 120)
                    }
                }
                
            }
            
        }
    }
}

#Preview {
    LiveView(selectedOption: .constant("Live"))
}
