//
//  Challenge.swift
//  Cookerz
//
//  Created by apprenant98 on 05/03/2025.
//

import Foundation

struct Challenge : Identifiable, Hashable {
    var id  : UUID = UUID()
    var name : String
    var icon : String
    var level : Level
    var description : String
    var points : Int
    var challengeStatus : ChallengeStatus
}

