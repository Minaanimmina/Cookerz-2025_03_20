//
//  ReceipeCardView.swift
//  Cookerz
//
//  Created by Emilie on 10/03/2025.
//

import SwiftUI

struct RecipeCardView: View {
    
    @EnvironmentObject var baseViewModel: BaseViewModel
    
    let recipe: Recipe

    var isFavorite: Bool {
        if let index = baseViewModel.user.listRecipes.firstIndex(where: { $0.id == recipe.id}) {
            return baseViewModel.user.listRecipes[index].isLiked
        } else {
            return false
        }
    }
    
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.grisBordure, lineWidth: 1)
                .background(Color.white)
            
            VStack(alignment: .leading) {
    
                ZStack (alignment : .topTrailing){
                    Image(recipe.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 278, height: 169)
                        .cornerRadius(8)
                    Button {
                        baseViewModel.toggleFavoriteRecipe(recipe : recipe)
         
                    }label : {
                        ZStack {
                            Circle()
                                .frame(width: 40, height : 40)
                                .foregroundColor(Color.white.opacity(0.7))
                            if isFavorite {
                                Image("fav_fill")
                                    .foregroundStyle(.black)
                            }else {
                                Image("fav")
                                    .foregroundStyle(.black)
                            }
                        }.padding()
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundStyle(Color.white)
                            .frame(width:84, height: 28)
                        HStack {
                            Image("minuteur")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height :15)
                            Text("\(recipe.durationHours) h \(recipe.durationMinutes)")
                                .font(.PoppinsFootnote())
                                .foregroundStyle(Color.black)
                        }
                    }
                    .position(x: 58, y: 140)
                }
                
                Text(recipe.title)
                    .font(.PoppinsBody())
                    .lineLimit(2)
                    .foregroundStyle(Color.black)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(maxHeight: 40)
                
                HStack {
                    if let userImage = users.first(where: { $0.id == recipe.creatorId })?.image {
                        Image(userImage)
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 24, height: 24)
                    } else {
                        Image(systemName: "person.crop.circle.fill") // Icône par défaut
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.grisFond)
                    }
                    Text(users.first { $0.id == recipe.creatorId }?.name ?? "Auteur inconnu")
                        .font(.PoppinsSubheadLight())
                        .foregroundStyle(Color.black)
                }
                Spacer()
            }
            .padding(8)
        }
        .frame(width: 294, height: 275)
    }
}

#Preview {
    RecipeCardView(recipe: recipes[0])
        .environmentObject(BaseViewModel())
}
