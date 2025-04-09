//
//  Untitled.swift
//  Cookerz
//
//  Created by Carole TREM on 12/03/2025.
//

import Foundation

extension Date {
    
    func timeAgo() -> String {
        let interval = Int(Date().timeIntervalSince(self))
        
        let minutes = interval / 60
        let hours = minutes / 60
        let days = hours / 24
        let weeks = days / 7
        let months = days / 30
        let years = days / 365
        
        if years > 0 {
            return "Il y a \(years) an\(years > 1 ? "s" : "")"
        } else if months > 0 {
            return "Il y a \(months) mois"
        } else if weeks > 0 {
            return "Il y a \(weeks) semaine\(weeks > 1 ? "s" : "")"
        } else if days > 0 {
            return "Il y a \(days) jour\(days > 1 ? "s" : "")"
        } else if hours > 0 {
            return "Il y a \(hours) heure\(hours > 1 ? "s" : "")"
        } else if minutes > 0 {
            return "Il y a \(minutes) minute\(minutes > 1 ? "s" : "")"
        } else {
            return "À l'instant"
        }
    }
}

var notifications : [Notification] = [
    Notification(type: .likePost, userSenderID: users[6].id, subjectID: userPosts[0].id, date: Date.from(string: "2025-03-10 12:34") ?? Date()),
    Notification(type: .abonnement, userSenderID: users[6].id, subjectID: users[0].id, date: Date.from(string: "2025-03-09 20:30") ?? Date()),
    Notification(type: .favRecipe , userSenderID: users[1].id, subjectID: recipes[0].id, date: Date.from(string: "2025-03-09 14:30") ?? Date()),
    Notification(type: .challengeStart, userSenderID: nil, subjectID: challenges[2].id, date: Date.from(string: "2025-03-09 16:30") ?? Date()),
    Notification(type: .abonnement, userSenderID: users[3].id, subjectID: users[3].id, date: Date.from(string: "2025-03-13 11:00") ?? Date()),
    Notification(type: .challengeEnd, userSenderID: nil, subjectID: challenges[1].id, date: Date.from(string: "2025-03-09 20:21") ?? Date()),
    Notification(type: .likePost, userSenderID: users[5].id, subjectID: userPosts[0].id, date: Date.from(string: "2025-03-12 20:10") ?? Date()),
    Notification(type: .atelierStart, userSenderID: users[10].id, subjectID: ateliers[0].id, date: Date.from(string: "2025-03-09 12:10") ?? Date()),
    Notification(type: .likePost, userSenderID: users[7].id, subjectID: userPosts[0].id, date: Date.from(string: "2025-03-13 11:50") ?? Date()),
]
