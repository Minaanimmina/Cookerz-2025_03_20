//
//  UstensilType.swift
//  Cookerz
//
//  Created by apprenant98 on 07/03/2025.
//

import Foundation

enum UstensilType: CaseIterable {
    case knife
    case cookerMachine
    case socket
    
    var name: String {
        switch self {
        case .knife:
            return "Couteau"
        case .cookerMachine:
            return "Cuiseur"
        case .socket:
            return "Douille"
        }
    }
    
    var Icon: String {
        switch self {
        case .knife:
            return "butcherknife"
        case .cookerMachine:
            return "mixer"
        case .socket:
            return "Chef hat"
        }
    }
}
