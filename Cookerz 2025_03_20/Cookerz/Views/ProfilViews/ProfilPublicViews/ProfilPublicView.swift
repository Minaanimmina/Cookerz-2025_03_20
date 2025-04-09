//
//  ProfilPublicView.swift
//  Cookerz
//
//  Created by Apprenant 78 on 11/03/2025.
//


import SwiftUI

struct ProfilPublicView: View {
    
    let columns = [
        GridItem(.flexible(), spacing: 4.5),
        GridItem(.flexible(), spacing: 4.5),
        GridItem(.flexible(), spacing: 4.5)
    ]
    
    @EnvironmentObject var baseViewModel: BaseViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HStack {
                        VStack {
                            ZStack {
                                Image(baseViewModel.user.image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 80, height: 80)
                                    .clipShape(Circle())
                                
                                Image("badge_newbie")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .offset(x: 35, y: 30)
                            }
                            
                            Text(baseViewModel.user.name)
                                .font(.PoppinsSubhead())
                        }
                        .padding(.leading, 5)
                        
                        Spacer ()
                            .frame(width: 40)

                        
                        VStack(spacing: 16) {
                            ProfilPublicNavigationView()
                            FollowUserButtonView(user: julien)
                        }
                    }
                    .padding(.bottom, 3)
                    
                    VStack(alignment: .leading, spacing: 6) {
                        
//                        Text("Modifier mon profil")
//                            .font(.PoppinsFootnoteMedium())
//                            .foregroundColor(.red300)
//                            .underline()
                        Text("Description")
                                                    .font(.PoppinsFootnote())
                                                    .padding(.top, 4)
                                                    .padding(.bottom, -2)
                        Text(baseViewModel.user.titleName)
                            .font(.PoppinsFootnoteLight())

                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Divider()
                    
                    Text("Les recettes de \(baseViewModel.user.name)")
                        .font(.PoppinsBody())
                    
                    LazyVGrid(columns: columns, spacing: 5) {
                        ForEach(baseViewModel.recipeCreatorUser){ recipe in
                            NavigationLink {
                                RecipePageView(recipe: recipe)
                            } label: {
                                Image(recipe.image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 111, height: 111)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                            }
                        }
                    }
                }
                .padding(.top, 20)
                .padding(.horizontal, 24)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Profil")
                            .font(.PoppinsTitle3Medium())
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        TotalUserPointsView()
                    }
                }.navigationBarTitleDisplayMode(.inline)

            }
        }
    }
}

#Preview {
    ProfilPublicView()
        .environmentObject(BaseViewModel())
}


