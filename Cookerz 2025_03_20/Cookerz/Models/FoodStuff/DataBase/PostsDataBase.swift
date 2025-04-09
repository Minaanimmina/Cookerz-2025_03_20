//
//  PostsDataBase.swift
//  Cookerz
//
//  Created by apprenant98 on 09/03/2025.
//

import Foundation

var userPosts : [Post] = [
    Post (creatorId: users[11].id, title: "Ma belle pizza au feu de bois", image: "pizzabois", date: Date.from(string: "2025-03-09") ?? Date(), level: .easy, likes: 0, durationHours: 0, durationMinutes: 30, isChallenge: false, challengeId: nil),
    
    Post (creatorId: users[1].id, title: "Défis : Légumes oubliés", image: "legumesoublies", date: Date.from(string: "2025-03-09") ?? Date(), level: .medium, likes: 50, durationHours: 1, durationMinutes: 30, isChallenge: true, challengeId: challenges[4].id),
    
    Post(creatorId: users[3].id, title: "Gâteau au chocolat fondant", image: "gateauchoco", date: Date.from(string: "2025-03-08") ?? Date(), level: .easy, likes: 120, durationHours: 0, durationMinutes: 45, isChallenge: false, challengeId: nil),
    
    Post(creatorId: users[7].id, title: "Défi : Pizza Party", image: "pizza2", date: Date.from(string: "2025-03-07") ?? Date(), level: .easy, likes: 200, durationHours: 2, durationMinutes: 0, isChallenge: true, challengeId: challenges[1].id),
    
    Post(creatorId: users[5].id, title: "Tarte aux pommes caramélisées", image: "tartepommes", date: Date.from(string: "2025-03-06") ?? Date(), level: .medium, likes: 90, durationHours: 1, durationMinutes: 15, isChallenge: false, challengeId: nil),
    
    Post(creatorId: users[2].id, title: "Défi : Batch Cooking", image: "batchcooking", date: Date.from(string: "2025-03-05") ?? Date(), level: .hard, likes: 85, durationHours: 1, durationMinutes: 0, isChallenge: true, challengeId: challenges[11].id),
    
    Post(creatorId: users[9].id, title: "Risotto aux champignons", image: "risotto", date: Date.from(string: "2025-03-04") ?? Date(), level: .medium, likes: 110, durationHours: 1, durationMinutes: 10, isChallenge: false, challengeId: nil),
    
    Post(creatorId: users[6].id, title: "Défi : Cuisiner en 20 minutes", image: "croquemonsieur", date: Date.from(string: "2025-03-03") ?? Date(), level: .easy, likes: 95, durationHours: 0, durationMinutes: 20, isChallenge: true, challengeId: challenges[0].id),
    
    Post(creatorId: users[8].id, title: "Sushis maison", image: "sushis", date: Date.from(string: "2025-03-02") ?? Date(), level: .hard, likes: 180, durationHours: 2, durationMinutes: 30, isChallenge: false, challengeId: nil),
    
    Post(creatorId: users[4].id, title: "Défi : Un dessert sans sucre ajouté", image: "bananabread", date: Date.from(string: "2025-03-01") ?? Date(), level: .medium, likes: 140, durationHours: 3, durationMinutes: 0, isChallenge: true, challengeId: challenges[7].id),
    
    Post(creatorId: users[9].id, title: "Salade estivale fraîche", image: "saladefraiche", date: Date.from(string: "2025-02-28") ?? Date(), level: .easy, likes: 75, durationHours: 0, durationMinutes: 15, isChallenge: false, challengeId: nil),

    Post(creatorId: users[10].id, title: "Défi : Repas pour 4 avec 10€", image: "repaspascher", date: Date.from(string: "2025-02-27") ?? Date(), level: .hard, likes: 160, durationHours: 4, durationMinutes: 0, isChallenge: true, challengeId: challenges[6].id),

    Post(creatorId: users[11].id, title: "Cookies aux pépites de chocolat", image: "cookies", date: Date.from(string: "2025-02-26") ?? Date(), level: .easy, likes: 130, durationHours: 0, durationMinutes: 30, isChallenge: false, challengeId: nil),

    Post(creatorId: users[3].id, title: "Défi : Pain maison", image: "homemadebread", date: Date.from(string: "2025-02-25") ?? Date(), level: .hard, likes: 95, durationHours: 1, durationMinutes: 0, isChallenge: true, challengeId: challenges[18].id),
    
    Post(creatorId: users[5].id, title: "Tagliatelles aux truffes", image: "tagliatelles", date: Date.from(string: "2025-02-24") ?? Date(), level: .hard, likes: 200, durationHours: 1, durationMinutes: 20, isChallenge: false, challengeId: nil),
    
    Post(creatorId: users[2].id, title: "Défi : Revisiter un plat classique", image: "platrevisite", date: Date.from(string: "2025-02-23") ?? Date(), level: .medium, likes: 110, durationHours: 1, durationMinutes: 10, isChallenge: true, challengeId: challenges[17].id),
    
    Post(creatorId: users[7].id, title: "Muffins aux myrtilles", image: "muffinsmyrtilles", date: Date.from(string: "2025-02-22") ?? Date(), level: .easy, likes: 125, durationHours: 0, durationMinutes: 40, isChallenge: false, challengeId: nil),
    
    Post(creatorId: users[6].id, title: "Défi : Un menu monochrome", image: "menumonochrome", date: Date.from(string: "2025-02-21") ?? Date(), level: .medium, likes: 210, durationHours: 3, durationMinutes: 30, isChallenge: true, challengeId: challenges[16].id),
    
    Post(creatorId: users[9].id, title: "Tiramisu classique", image: "tiramisu2", date: Date.from(string: "2025-02-20") ?? Date(), level: .medium, likes: 140, durationHours: 2, durationMinutes: 0, isChallenge: false, challengeId: nil)
]

