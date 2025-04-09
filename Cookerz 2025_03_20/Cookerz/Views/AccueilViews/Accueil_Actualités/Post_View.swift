//
//  Post_View.swift
//  Cookerz
//
//  Created by Carole TREM on 11/03/2025.
//

import SwiftUI

struct Post_View: View {
    
    @State var isLiked : Bool = false
    @State var nbLikes : Int = 10
    
    var post : Post
    
    var postCreator: User? {
        for user in users {
            if user.id == post.creatorId {
                return user
            }
        }
        return nil
    }
    
    var challenge: Challenge? {
        for challenge in challenges {
            if challenge.id == post.challengeId {
                return challenge
            }
        }
        return nil
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            // photo et nom user
            HStack {
                NavigationLink(destination: ProfilPublicView()) {
                    HStack {
                        Image(postCreator?.image ?? "null")
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 32, height: 32)
                        Text(postCreator?.name ?? "null")
                            .font(.PoppinsBody())
                    }
                    .padding(.bottom, 2)
                    .foregroundStyle(Color.black)
                }
                Spacer()
                
                // indication si défi
                if post.isChallenge {
                    HStack {
                        Image("check")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 11, height: 7.5)
                        Text("Défi")
                            .font(.PoppinsCaption1())
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(
                        RoundedRectangle(cornerRadius: 9999)
                            .strokeBorder(Color.green, lineWidth: 1))
                }
                else {
                    Text("")
                        .padding(.bottom, 4)
                }
            }
            
            // photo post
            Image(post.image)
                .resizable()
                .scaledToFill()
                .frame(width: 313, height: 184)
                .cornerRadius(12)
            
            // titre post
            Text(post.isChallenge ? "\(challenge?.name ?? "null")" : "\(post.title ?? "null")")
                .font(.PoppinsBodyMedium())
                .padding(.top, 6)
                .padding(.bottom, -2)
            
            // point défi ou durée recette + niv recette/défi
            HStack {
                // point défi ou durée recette
                HStack {
                    Image(post.isChallenge ? "radish_points" : "minuteur")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15, height: 15)

                    Text(post.isChallenge ?
                        "\(challenge?.points ?? 0)" :
                        {
                            let hours = post.durationHours ?? 0
                            let minutes = post.durationMinutes ?? 0
                            if hours > 0 {
                                return minutes > 0 ? "\(hours)h\(minutes)" : "\(hours)h"
                            } else {
                                return "\(minutes) min"
                            }
                        }()
                    )
                    .font(.PoppinsCaption2())
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(Color.grisBordure, lineWidth: 1))
                
                // niv recette/défi
                HStack {
                    HStack(spacing: 0.1) {
                        if post.level.IconBlackWhite == "flame1_bw" {
                            Image("flame1_color")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                        } else if post.level.IconBlackWhite == "flame2_bw" {
                            Image("flame1_color")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                            Image("flame1_color")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                        } else if post.level.IconBlackWhite == "flame3_bw" {
                            Image("flame1_color")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                            Image("flame1_color")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                            Image("flame1_color")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                        }
                    }
                    Text(post.level.name)
                        .font(.PoppinsCaption2())
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(Color.grisBordure, lineWidth: 1))
            }
            .padding(.bottom, 8)
            
            
            // nbre like et date post + coeur bouton favoris
            HStack {
                VStack(alignment: .leading) {
                    Text("Aimé par \(nbLikes) personnes")
                        .font(.PoppinsCaption2())
                    Text(post.date.timeAgoInDays())
                        .font(.PoppinsCaption2Light())
                }
                .foregroundColor(Color.black).opacity(0.6)
                
                Spacer()
                
                Button {
                    isLiked.toggle()
                    nbLikes += isLiked ? 1 : -1
                } label: {
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 18)
                        .foregroundStyle(Color.accentColor)
                        .font(.system(size: 24, weight: .thin))
                        .frame(width: 32, height: 32)
                                .contentShape(Rectangle())
                }
            }
            
        }
        .padding(16)
        .frame(width: 345, height: 367)
        .background(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Color.grisBordure, lineWidth: 1))
    }
}

#Preview {
    Post_View(post: userPosts[1])
        .environmentObject(BaseViewModel())
}

// extension pour formatter la date
extension Date {
    func timeAgoInDays() -> String {
        let calendar = Calendar.current
        let now = Date()
        let components = calendar.dateComponents([.day, .hour], from: self, to: now)
        
        if let days = components.day, days > 0 {
            return "Posté il y a \(days) jour\(days > 1 ? "s" : "")"
        } else if let hours = components.hour, hours > 0 {
            return "Posté il y a \(hours) heure\(hours > 1 ? "s" : "")"
        }
        
        return "Aujourd'hui"
    }
}

