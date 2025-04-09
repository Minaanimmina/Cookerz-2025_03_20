//
//  Ingredient.swift
//  Cookerz
//
//  Created by apprenant98 on 07/03/2025.
//

import Foundation

struct Ingredient : Identifiable, Hashable{
    var id  : UUID = UUID()
    var name : String
    var type : IngredientType
    var quantity : Double?
    var unit : IngredientUnit?
}


