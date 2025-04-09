//
//  AteliersDataBase.swift
//  Cookerz
//
//  Created by apprenant98 on 09/03/2025.
//

import Foundation

extension Date {
    // Create a Date from a string with a specified format (default is "yyyy-MM-dd")
    static func from(string: String, format: String = "yyyy-MM-dd") -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: string)
    }

    // Convert Date to String with optional time formatting
    func toString(format: String = "EEEE, d MMM yyyy", includeTime: Bool = false, locale: String = "fr_FR") -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: locale)

        // Base format without time
        var finalFormat = format

        // Add time to the format if includeTime is true
        if includeTime {
            finalFormat += " HH:mm"
        }

        // Set the date format
        formatter.dateFormat = finalFormat
        return formatter.string(from: self)
    }
}

var ateliers: [Atelier] = [
    Atelier(
        creatorId: users[1].id,
        title: "Utiliser une poche à douille",
        image: "live3",
        date: Date.from(string: "2025-03-09 14:30") ?? Date(),  // Directement la date formatée
        portion: 6,
        level: .hard,
        description: "Vous allez apprendre tout sur la poche à douille, de la création, au remplissage, aux différentes douilles jusqu'aux mouvements de la main. \n \nPendant la 1ère heure, nous nous occuperons de la mixture donc si vous préférez en acheter une préfaite ou que vous n'avez pas le temps, n'hésitez pas! \n Vous pouvez aussi la préparer le veille et la congeler jusqu'à l'occasion, la recette est sur mon profil.",
        ingredients: atelier0Ingredients,
        ustensils: atelierOUstensils,
        usersRegistered: [],
        nbSeats: 20),

    Atelier(
        creatorId: users[2].id,
        title: "Fais tes pâtes maison !",
        image: "live1",
        date: Date.from(string: "2025-03-09 16:30") ?? Date(),  // Directement la date formatée
        portion: 6,
        level: .medium,
        description: "Apprends à réaliser des pâtes fraîches maison, des tagliatelles aux raviolis, avec des sauces authentiques italiennes.",
        ingredients: atelier0Ingredients,
        ustensils: atelierOUstensils,
        usersRegistered: [],
        nbSeats: 10),
    Atelier(
        creatorId: users[3].id,
        title: "Brunch healthy",
        image: "live3",
        date: Date.from(string: "2025-03-09 17:30") ?? Date(),  // Directement la date formatée
        portion: 6,
        level: .easy,
        description: "Un atelier idéal pour apprendre à préparer un brunch gourmand et équilibré avec des smoothie bowls et des pancakes moelleux.",
        ingredients: atelier0Ingredients,
        ustensils: atelierOUstensils,
        usersRegistered: [],
        nbSeats: 5),
    Atelier(
        creatorId: users[1].id,
        title: "Cuisine Asiatiques Fusion",
        image: "live1",
        date: Date.from(string: "2025-03-20 18:45") ?? Date(),
        portion : 6,
        level: .hard,
        description: "Un atelier où l'on explore des saveurs asiatiques fusionnées avec des techniques modernes, avec des plats comme des sushis revisités ou des bao buns gourmands.",
        ingredients: atelier0Ingredients,
        ustensils: atelierOUstensils,
        usersRegistered: [],
        nbSeats: 6),
    Atelier(
        creatorId: users[2].id,
        title: "Pâtisserie Vegan",
        image: "livepatisserievegan",
        date: Date.from(string: "2025-03-15 20:15") ?? Date(),
        portion: 6,
        level: .medium,
        description: "Un atelier pour découvrir des alternatives végétales dans la pâtisserie, avec des recettes de gâteaux, cookies et tartes sans produits d'origine animale.",
        ingredients: atelier0Ingredients,
        ustensils: atelierOUstensils,
        usersRegistered: [],
        nbSeats: 8),
    Atelier(
        creatorId: users[5].id,
        title: "Cuisine Méditerranéenne",
        image: "live1",
        date: Date.from(string: "2025-04-02 21:15") ?? Date(),
        portion: 6,
        level: .medium,
        description: "Un atelier pour découvrir la richesse des saveurs méditerranéennes, avec des recettes comme le couscous, les taboulés et des légumes grillés aux herbes.",
        ingredients: atelier0Ingredients,
        ustensils: atelierOUstensils,
        usersRegistered: [],
        nbSeats: 8),
    Atelier(
        creatorId: users[4].id,
        title: "Les Bases de la Cuisine Française",
        image: "live3",
        date: Date.from(string: "2025-03-25 10:30") ?? Date(),
        portion: 6,
        level: .easy,
        description: "Apprenez les classiques de la cuisine française, de la quiche Lorraine aux croissants maison, pour maîtriser les bases et épater vos invités.",
        ingredients: atelier0Ingredients,
        ustensils: atelierOUstensils,
        usersRegistered: [],
        nbSeats: 10)
]
