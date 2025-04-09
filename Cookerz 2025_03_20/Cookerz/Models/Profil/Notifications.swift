//
//  Untitled.swift
//  Cookerz
//
//  Created by Carole TREM on 12/03/2025.
//

import Foundation

struct  Notification : Identifiable {
    var id = UUID()
    var type : NotificationsType
    var userSenderID : UUID?
    var subjectID : UUID
    var date : Date
}
