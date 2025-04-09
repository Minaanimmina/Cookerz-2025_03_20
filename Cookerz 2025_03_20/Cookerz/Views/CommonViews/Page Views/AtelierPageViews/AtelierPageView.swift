//
//  AtelierPageView.swift
//  Cookerz
//
//  Created by apprenant98 on 10/03/2025.
//

import SwiftUI
struct AtelierPageView: View {
    var atelier: Atelier
    var atelierCreatorId: UUID { atelier.creatorId }
    var atelierCreator: User? {
        for user in users {
            if user.id == atelierCreatorId {
                return user
            }
        }
        return nil
    }
    
    @State var selectedPart: AtelierEnum = .description
    @State var numberPortionChosen: Int = 1
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            ScrollView {
                ZStack(alignment: .top) {
                    BackgroungImage(imageName: atelier.image)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        AtelierPageTransparentFrontBGImage()
                        
                        VStack {
                            PageHeaderView(elementTitle: atelier.title, recipeCreator: atelierCreator)
                            
                            HStack(spacing: 8) {
                                AtelierPageDateView(atelier: atelier)
                                PageGeneralInfosView(GeneralInfoIcon: atelier.level.IconBlackWhite, GeneralInfoText: atelier.level.name)
                                PageGeneralInfosView(GeneralInfoIcon: "nb_participants", GeneralInfoText: "\(atelier.usersRegistered.count) inscrits")
                            }
                            
                            AtelierDoublePickerView(selectedPart: $selectedPart)
                        
                            if selectedPart == .description {
                                Text("\(atelier.description)")
                                    .font(.PoppinsSubhead())
                            }
                                else {
                                    PageStuffView( numberPortionChosen: $numberPortionChosen, numberPortionBase: atelier.portion, listIngredients : atelier.ingredients,
                                                   listUstensils : atelier.ustensils)
                                }
                                    
                          
                        }
                        .padding(20)
                        .padding(.bottom, 20)
                        .background(Color.white)
                        .cornerRadius(20)
                    }
                }
                .padding(.top, 8)
            }
        }
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
        .onAppear {
            numberPortionChosen = atelier.portion
        }
    }
}

#Preview {
    AtelierPageView(atelier : ateliers[0])
}


















