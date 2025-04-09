//
//  PublierOptionView.swift
//  Cookerz
//
//  Created by Apprenant 85 on 11/03/2025.
//

import SwiftUI

struct PublierOptionView: View {
    @EnvironmentObject var baseViewModel: BaseViewModel
    @State var text: String = ""
    @State var numberofflame: Int = 1
    let numberofflameMin: Int = 1
    let numberofflameMax: Int = 3
    @Binding var selectedImage: String?
    @State var isPublicationPickerPresented: Bool = false
    @State var PublicationTimeHours = 0
    @State var PublicationTimeMinutes = 0
    @State private var displayedTime: String = "Durée de la recette"
    @Binding var selectedTab: Int
    
    var body: some View {
        ZStack(alignment: .top){
            Color.white.edgesIgnoringSafeArea(.all)
            
            VStack {
                
                VStack {
                    PublierTopbarConfirmView(
                        selectedImage: $selectedImage,
                        text: $text,
                        numberofflame: $numberofflame,
                        PublicationTimeHours: $PublicationTimeHours,
                        PublicationTimeMinutes: $PublicationTimeMinutes, selectedTab: $selectedTab
                    )
                    .environmentObject(baseViewModel)
                    
                    PhotoSelectionView(selectedImage: $selectedImage)
                        .clipShape(RoundedRectangle(cornerRadius:12))
                    
                    HStack {
                        Spacer()
                        TextField("Ajouter un titre", text: $text)
                            .padding()
                            .multilineTextAlignment(.center)
                            .font(.PoppinsTitle3Medium())
                        Spacer()
                    }
                    
                    HStack {
                        Button(action: {
                            if numberofflame > numberofflameMin {
                                numberofflame -= 1
                            }
                        }) {
                            Text("-")
                                .foregroundColor(Color.black)
                                .frame(width: 40, height: 40)
                                .background(Circle().stroke(Color("Gris Bordure"), lineWidth: 2))
                        }
                        
                        HStack{
                            ForEach(0..<numberofflame, id: \.self) { _ in
                                FlameDifficulty()
                            }
                        }
                        .frame(width: 130, height: 40)
                        
                        Button(action: {
                            if numberofflame < numberofflameMax {
                                numberofflame += 1
                            }
                        }) {
                            Text("+")
                                .foregroundColor(Color.black)
                                .frame(width: 40, height: 40)
                                .background(Circle().stroke(Color("Gris Bordure"), lineWidth: 2))
                        }
                    }
                    VStack{
                        ZStack{
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color("red-50"))
                                    .frame(width: 220, height: 40)
                                
                                HStack{
                                    Button(action:{
                                        isPublicationPickerPresented = true
                                    }){
                                        Spacer()
                                        
                                        Text("\(displayedTime)")
                                            .foregroundColor(Color.black)
                                        Spacer()
                                        Image(systemName: "chevron.down")
                                            .foregroundColor(Color.black)
                                            .frame(width: 10, height: 10)
                                            .font(.title3)
                                        
                                        Spacer()
                                    }
                                }.frame(width: 220, height: 40)
                                
                            }
                            
                            
                        }
                    }.padding()
                    Spacer()
                }
                
            }
            if isPublicationPickerPresented {
                PublierPickerModalView(isPublicationPickerPresented: $isPublicationPickerPresented, PublicationTimeHours: $PublicationTimeHours, PublicationTimeMinutes: $PublicationTimeMinutes,displayedTime: $displayedTime)
                
            }
        }.toolbar(.hidden)

    }
}
#Preview {
    PublierOptionView(selectedImage: .constant("gras1"), selectedTab: .constant(0))
        .environmentObject(BaseViewModel())
}

