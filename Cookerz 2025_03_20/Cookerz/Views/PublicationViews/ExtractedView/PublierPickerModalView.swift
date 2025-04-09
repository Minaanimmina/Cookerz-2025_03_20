//
//  PublierPickerModalView.swift
//  Cookerz
//
//  Created by Apprenant 85 on 12/03/2025.
//

import SwiftUI

struct PublierPickerModalView: View {
    @Binding var isPublicationPickerPresented: Bool
    @Binding var PublicationTimeHours : Int
    @Binding var PublicationTimeMinutes : Int
    @Binding var displayedTime : String
    var body: some View {
        VStack{
            Spacer()
            VStack {
                HStack {
                    Text ("Temps total")
                        .foregroundStyle(Color.black)
                    Spacer()
                    Button {
                        if PublicationTimeHours == 0 {
                                displayedTime = "\(PublicationTimeMinutes)min"
                            if PublicationTimeHours == 0 && PublicationTimeMinutes == 0 {
                                displayedTime = "Durée de la recette"
                            }
                            } else {
                                displayedTime = "\(PublicationTimeHours)h \(PublicationTimeMinutes)min"
                            }

                        isPublicationPickerPresented.toggle()
                    }label:{
                        Text("Valider")
                            .foregroundStyle(Color.blue)
                    }
                }
                .padding()
                .background(Color.grisFond.opacity(0.5))
                .cornerRadius(10)
                
                
                HStack {
                    Spacer()
                    HStack {
                        Picker("Heures", selection: $PublicationTimeHours) {
                            ForEach(0...120, id: \.self) { hour in
                                Text("\(hour)")
                            }
                        }
                        .pickerStyle(.wheel)
                        .frame(height: 150)
                        .clipped()
                        Text("h")
                        
                        Spacer()
                        
                        Picker("Minutes", selection: $PublicationTimeMinutes) {
                            ForEach(0...59, id: \.self) { minute in
                                Text("\(minute)")
                            }
                        }
                        .pickerStyle(.wheel)
                        .frame(height: 150)
                        .clipped()
                        
                        Text("min")
                        
                    }
                    Spacer()
                    
                }
                
                
            }
            .padding(.horizontal, 25)
            .frame(maxHeight: 310)
            .background(Color.white)
        }
    }
}


#Preview {
    PublierOptionView(selectedImage: .constant("gras1"), selectedTab: .constant(1))
        .environmentObject(BaseViewModel())
}
