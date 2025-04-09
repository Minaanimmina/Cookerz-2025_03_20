//
//  SearchCardRecipeView.swift
//  Cookerz
//
//  Created by Emilie on 11/03/2025.
//

import SwiftUI

struct SearchCardRecipeView: View {
    
    @EnvironmentObject var baseViewModel: BaseViewModel

    let recipe: Recipe
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.grisBordure, lineWidth: 1)
                .background(Color.white)
            
            HStack {
                Spacer()
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 104, height: 104)
                    .cornerRadius(8)
                
                VStack(alignment: .leading) {
                    Text(recipe.title)
                        .font(.PoppinsBodyMedium())
                        .foregroundStyle(.black)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(maxHeight: 40)
                        .padding(.trailing, 8)
                    
                    HStack {
                        Image(users.first { $0.id == recipe.creatorId }?.image ?? "defaultUser")
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 27, height: 27)
                        Text("de \(users.first { $0.id == recipe.creatorId }?.name ?? "Auteur inconnu")")
                            .font(.PoppinsFootnoteLight())
                            .foregroundStyle(Color.black)
                    }
                    
                    HStack {
                        HStack {
                            Image("minuteur")
                                .resizable()
                                .scaledToFit()
                                .frame(height :20)
                            Text("\(recipe.durationHours) h \(recipe.durationMinutes)")
                                .font(.PoppinsCaption1())
                                .foregroundStyle(Color.black)
                        }
                        Spacer()
                        HStack {
                            Image("nb_plate")
                                .resizable()
                                .scaledToFit()
                                .frame(height :20)
                            Text("\(recipe.portion) parts")
                                .font(.PoppinsCaption1())
                                .foregroundStyle(Color.black)
                        }
                        Spacer()
                        HStack {
                            Image(recipe.level.IconColor)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 20)
                        }
                        Spacer()
                    }
                }
                .padding(.leading, 4)
            }
        }
        .frame(width: 345, height: 120)
        .padding(.bottom, 8)
    }
}

#Preview {
    SearchCardRecipeView(recipe: recipes[0])
        .environmentObject(BaseViewModel())
}
