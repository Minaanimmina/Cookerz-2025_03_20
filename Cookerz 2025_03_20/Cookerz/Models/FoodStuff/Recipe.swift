//
//  Recipe.swift
//  Cookerz
//
//  Created by apprenant98 on 05/03/2025.
//

import Foundation

struct Recipe : Identifiable{
    var id  : UUID = UUID()
    var creatorId : UUID
    var title : String
    var image : String
    var type : [RecipeType]
    var portion : Int
    var durationHours : Int
    var durationMinutes : Int
    var level : Level
    var likes : Int
    var ingredients : [Ingredient]
    var ustensils : [Ustensil]
    var steps : [String]
    var isLiked : Bool
}

