//
//  IngredientType.swift
//  Cookerz
//
//  Created by apprenant98 on 05/03/2025.
//

import Foundation

enum IngredientUnit :  CaseIterable {
    case piece
    case leaf
    case bunch
    case gramme
    case kilogramme
    case miliLitre
    case litre
    case bigSpoon
    case littleSpoon
    
    var name : String {
        switch self {
        case .piece :
            return "unité"
        case .leaf :
            return "Feuille"
        case .bunch :
            return "Botte"
        case .gramme :
            return "Gramme"
        case .kilogramme :
            return "Kilogramme"
        case .miliLitre :
            return "MiliLitre"
        case .litre :
            return "Litre"
        case .bigSpoon :
            return "Grande Cuillière"
        case .littleSpoon :
            return "Petite Cuillère"
            
        }
    }
    
    var initial : String {
        switch self {
        case .piece :
            return ""
        case .leaf :
            return "feuille"
        case .bunch :
            return "botte"
        case .gramme :
            return "g"
        case .kilogramme :
            return "Kg"
        case .miliLitre :
            return "mL"
        case .litre :
            return "L"
        case .bigSpoon :
            return "càs"
        case .littleSpoon :
            return "càc"
            
        }
    }
}
