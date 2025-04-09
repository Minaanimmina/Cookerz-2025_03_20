//
//  Level.swift
//  Cookerz
//
//  Created by apprenant98 on 05/03/2025.
//

import Foundation

enum Level {
    case defaultdifficulty
    case easy
    case medium
    case hard
    
    var name : String {
        switch self {
        case .defaultdifficulty :
            return "Difficulté"
        case .easy:
            return "Facile"
        case .medium:
            return "Moyen"
        case .hard:
            return "Difficile"
        }
    }
    
    var IconColor : String {
        switch self {
        case .defaultdifficulty :
            return ""
        case .easy:
            return "flame1_color"
        case .medium:
            return "flame2_color"
        case .hard:
            return "flame3_color"
        }
    }
    
    var IconBlackWhite : String {
        switch self {
        case .defaultdifficulty :
            return ""
        case .easy:
            return "flame1_bw"
        case .medium:
            return "flame2_bw"
        case .hard:
            return "flame3_bw"
        }
    }

}
