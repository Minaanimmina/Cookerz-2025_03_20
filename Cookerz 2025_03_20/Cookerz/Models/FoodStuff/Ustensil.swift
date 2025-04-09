//
//  Ustensil.swift
//  Cookerz
//
//  Created by apprenant98 on 07/03/2025.
//

import Foundation

struct Ustensil : Identifiable, Hashable{
    var id  : UUID = UUID()
    var name : String
    var type : UstensilType
}


