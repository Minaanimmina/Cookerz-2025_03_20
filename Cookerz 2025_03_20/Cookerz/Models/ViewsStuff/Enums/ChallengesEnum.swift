//
//  ChallengesEnum.swift
//  Cookerz
//
//  Created by apprenant98 on 07/03/2025.
//


enum ChallengesEnum: String, CaseIterable {
    case challenges = "Défis"
    case inProgress = "En cours"
    case rewards = "Récompenses"
    
    var name : String {
        switch self {
        case .challenges:
            return "Défis"
        case .inProgress :
            return "En cours"
        case .rewards :
            return "Récompenses"
            
        }
    }
    
}


