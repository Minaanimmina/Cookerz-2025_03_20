//
//  HomeEnum.swift
//  Cookerz
//
//  Created by apprenant98 on 07/03/2025.
//

enum HomeEnum {
    case actualities
    case ateliers
    
    var name : String {
        switch self {
        case .actualities:
            return "Actualités"
        case .ateliers :
            return "Ateliers"
            
        }
    }
    
}
