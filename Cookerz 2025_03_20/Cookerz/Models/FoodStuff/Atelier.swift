//
//  Atelier.swift
//  Cookerz
//
//  Created by apprenant98 on 05/03/2025.
//

import SwiftUI

struct Atelier: Identifiable {
    var id: UUID = UUID()
    var creatorId: UUID
    var title: String
    var image: String
    var date: Date
    var portion : Int
    var level: Level
    var description: String
    var ingredients: [Ingredient]
    var ustensils: [Ustensil]
    var usersRegistered: [UUID]
    var nbSeats: Int
    var liveUrl: String?
}





