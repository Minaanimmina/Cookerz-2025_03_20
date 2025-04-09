//
//  AtelierEnum.swift
//  Cookerz
//
//  Created by apprenant98 on 13/03/2025.
//

enum AtelierEnum {
    case description
    case ingredients
   
    
    var name : String {
        switch self {
        case .description :
            return "Description"
        case .ingredients :
            return "Ingredients"
       
            
        }
    }
    
}
