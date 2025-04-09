//
//  ProfilEnum.swift
//  Cookerz
//
//  Created by apprenant98 on 07/03/2025.
//

enum ProfilEnum {
    case myRecipes
    case myChallenges
    case myFollowings
    
    var name : String {
        switch self {
        case .myRecipes :
            return "Mes Recettes"
        case .myChallenges :
            return "Mes Défis"
            
        case .myFollowings :
            return "Mes Abos"
            
        }
    }
    
}
