//
//  Reward.swift
//  Cookerz
//
//  Created by apprenant98 on 05/03/2025.
//

import Foundation

struct Reward: Identifiable {
    var id  : UUID = UUID()
    var name : String
    var type : RewardsType
    var icon : String
    var description : String
    var points : Int
    var code : String?
}


