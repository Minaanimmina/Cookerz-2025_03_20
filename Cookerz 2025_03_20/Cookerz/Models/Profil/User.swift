//
//  User.swift
//  Cookerz
//
//  Created by apprenant98 on 05/03/2025.
//

// à voir si on supprime liste de recipes

import Foundation

struct User : Identifiable{
    var id  : UUID = UUID()
    var name : String
    var titleName : String
    var image : String
    
    var listRecipes : [Recipe] 
    
    var listRecipesCount: Int {
        listRecipes.count
    }
    
    // Followers
    var listFollowersId : [UUID]
    
//    var listFollowersCount: Int {
//        listFollowersId.count
//    }
    
    // Followed
    var listFollowedId : [UUID]
    
//    var listFollowedCount: Int {
//        listFollowedId.count
//    }
    
    // Challenges
    var listChallenges : [Challenge]
    
    // Rewards
    var rewardsUsed : [Reward]

//     Current points
    

}

