//
//  Post.swift
//  Cookerz
//
//  Created by apprenant98 on 05/03/2025.
//

import Foundation

struct Post : Identifiable{
    var id  : UUID = UUID()
    var creatorId : UUID
    var title : String?
    var image : String
    var date : Date
    var level : Level
    var likes : Int
    var durationHours : Int?
    var durationMinutes : Int?
    
    
    // défi
    var isChallenge : Bool
    var challengeId : UUID?
}



