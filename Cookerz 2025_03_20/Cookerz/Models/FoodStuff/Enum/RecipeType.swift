//
//  IngredientType.swift
//  Cookerz
//
//  Created by apprenant98 on 05/03/2025.
//

import Foundation

enum RecipeType : CaseIterable {
    case asian
    case italian
    case french
    case vegetarien
    case vegan
    case dairyFree
    
    var name : String {
        switch self {
            case .asian :
                return "Asiatique"
            case .italian :
                return "Italien"
            case .french :
                return "Français"
            case .vegetarien :
                return "Végétarien"
            case .vegan :
                return "Végétalien"
            case .dairyFree :
                return "Sans Lactose"
        }
    }
    
    var icon : String {
        switch self {
            case .asian :
                return "asiatique"
            case .italian :
                return "italien"
            case .french :
                return "français"
            case .vegetarien :
                return "vegetarienIcon"
            case .vegan :
                return "vegetalien"
            case .dairyFree :
                return "sans-lactose"
        }
    }
}
