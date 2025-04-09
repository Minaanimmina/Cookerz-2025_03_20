//
//  RecipeEnum.swift
//  Cookerz
//
//  Created by apprenant98 on 07/03/2025.
//

enum RecipeEnum {
    case ingredients
    case instructions
    
    var name : String {
        switch self {
        case .ingredients :
            return "Ingredients"
        case .instructions :
            return "Instructions"
            
        }
    }
    
}
