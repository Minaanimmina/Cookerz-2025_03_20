//
//  ChallengesDataBase.swift
//  Cookerz
//
//  Created by apprenant98 on 09/03/2025.
//

var challenge0 = Challenge(name: "Cuisiner en 20 minutes", icon: "timer", level: .easy, description: "Préparer un plat dans le temps record imparti : 20 minutes pour se surprendre !", points: 150, challengeStatus: .isNotStarted)

var challenge1 = Challenge(name: "Pizza Party", icon: "pizza", level: .easy, description: "Faire une pizza avec une pâte maison et une garniture au choix", points: 50, challengeStatus: .onGoing)

var challenge2 = Challenge(name: "La plus belle tarte", icon: "tarte", level: .medium, description: "Créer une tarte aussi belle que délicieuse", points: 120, challengeStatus: .isNotStarted)

var challenge3 = Challenge(name: "Une soupe de restes", icon: "honey", level: .hard, description: "Préparer une soupe en utilisant uniquement ce qu'il y a dans le frigo et les placards", points: 150, challengeStatus: .isFinished)

var challenge4 = Challenge(name: "Préparer un repas végétalien", icon: "celeri", level: .medium, description: "Un défi pour les amateurs de cuisine végétalienne !", points: 100, challengeStatus: .isNotStarted)

var challenge5 = Challenge(name: "Recette en 5 ingrédients", icon: "plate", level: .easy, description: "Cuisiner un plat avec seulement 5 ingrédients", points: 150, challengeStatus: .isNotStarted)

var challenge6 = Challenge(name: "Repas pour 4 avec 10€", icon: "plate", level: .hard, description: "Préparer un repas délicieux sans dépasser le budget !", points: 200, challengeStatus: .isNotStarted)

var challenge7 = Challenge(name: "Un dessert sans sucre ajouté", icon: "tarte", level: .medium, description: "Cuisiner un dessert sans sucre raffiné", points: 90, challengeStatus: .isNotStarted)

var challenge8 = Challenge(name: "Cuisiner un plat exotique", icon: "hotpot", level: .medium, description: "Préparer un plat typique d'une autre culture", points: 130, challengeStatus: .isNotStarted)

var challenge9 = Challenge(name: "Repas du soir en moins de 30 minutes", icon: "timer", level: .medium, description: "Cuisiner un dîner rapide mais délicieux", points: 100, challengeStatus: .isNotStarted)

var challenge10 = Challenge(name: "Un plat avec un ingrédient surprise", icon: "salt", level: .medium, description: "Cuisiner un plat intégrant un ingrédient que vous n'utilisez jamais.", points: 110, challengeStatus: .isNotStarted)

var challenge11 = Challenge(name: "Batch Cooking", icon: "dishes", level: .hard, description: "Préparer des repas pour toute la semaine en une seule session de cuisine", points: 180, challengeStatus: .isNotStarted)

var challenge12 = Challenge(name: "Défi zéro déchet", icon: "stew-1", level: .hard, description: "Cuisiner un repas en générant le moins de déchets possible", points: 170, challengeStatus: .isNotStarted)

var challenge13 = Challenge(name: "Petit-déjeuner complet", icon: "coffee-maker", level: .easy, description: "Créer un petit-déjeuner sain et gourmand", points: 80, challengeStatus: .isNotStarted)

var challenge14 = Challenge(name: "Dîner romantique", icon: "dish", level: .medium, description: "Préparer un dîner raffiné pour une occasion spéciale", points: 140, challengeStatus: .isFinished)

var challenge15 = Challenge(name: "Un menu monochrome", icon: "potatoes-2", level: .medium, description: "Cuisiner un plat ou un menu avec des ingrédients de la même couleur", points: 120, challengeStatus: .isNotStarted)

var challenge16 = Challenge(name: "Revisiter un plat classique", icon: "Chef hat", level: .medium, description: "Donner une touche moderne à un plat traditionnel", points: 130, challengeStatus: .isNotStarted)

var challenge17 = Challenge(name: "Pain maison", icon: "bread", level: .hard, description: "Faire son propre pain sans machine à pain. À vos biscottos !", points: 160, challengeStatus: .isNotStarted)

var challenge18 = Challenge(name: "Un plat 100% local et de saison", icon: "groceries", level: .medium, description: "Cuisiner uniquement avec des ingrédients produits localement et de saison", points: 140, challengeStatus: .isFinished)

var challenge19 = Challenge(name: "Légumes oubliés", icon: "celeri", level: .medium, description: "Les légumes oubliés sont de bons produits : essaie de faire des recettes avec l'un d'eux comme ingrédient principal ! Savais-tu que le poireau avait un ancêtre ?", points: 200, challengeStatus: .isNotStarted)

var challenges = [
    challenge0, challenge1, challenge2, challenge3, challenge4, challenge5, challenge6, challenge7, challenge8, challenge9, challenge10,
    challenge11, challenge12, challenge13, challenge14, challenge15, challenge16, challenge17, challenge18, challenge19
]


//var challenges: [Challenge] = [
//    Challenge(name: "Cuisiner en 20 minutes", icon: "timer", level: .hard, description: "Préparer un plat dans le temps record imparti : 20 minutes pour se surprendre !", points: 150, challengeStatus: .isNotStarted),
//    Challenge(name: "Pizza Party", icon: "pizza", level: .easy, description: "Faire une pizza avec une pâte maison et une garniture au choix", points: 50, challengeStatus: .isNotStarted),
//    Challenge(name: "La plus belle tarte", icon: "tarte", level: .medium, description: "Créer une tarte aussi belle que délicieuse", points: 120, challengeStatus: .isNotStarted),
//    Challenge(name: "Une soupe de restes", icon: "honey", level: .hard, description: "Préparer une soupe en utilisant uniquement ce qu'il y a dans le frigo et les placards", points: 150, challengeStatus: .isNotStarted),
//    Challenge(name: "Préparer un repas végétalien", icon: "celeri", level: .medium, description: "Un défi pour les amateurs de cuisine végétalienne !", points: 100, challengeStatus: .isNotStarted),
//    Challenge(name: "Recette en 5 ingrédients", icon: "plate", level: .easy, description: "Cuisiner un plat avec seulement 5 ingrédients", points: 150, challengeStatus: .isNotStarted),
//    Challenge(name: "Repas pour 4 avec 10€", icon: "plate", level: .hard, description: "Préparer un repas délicieux sans dépasser le budget !", points: 200, challengeStatus: .isNotStarted),
//    Challenge(name: "Un dessert sans sucre ajouté", icon: "tarte", level: .medium, description: "Cuisiner un dessert sans sucre raffiné", points: 90, challengeStatus: .isNotStarted),
//    Challenge(name: "Cuisiner un plat exotique", icon: "hotpot", level: .medium, description: "Préparer un plat typique d'une autre culture", points: 130, challengeStatus: .isNotStarted),
//    Challenge(name: "Repas du soir en moins de 30 minutes", icon: "timer", level: .medium, description: "Cuisiner un dîner rapide mais délicieux", points: 100, challengeStatus: .isNotStarted),
//    Challenge(name: "Un plat avec un ingrédient surprise", icon: "salt", level: .medium, description: "Cuisiner un plat intégrant un ingrédient que vous n'utilisez jamais.", points: 110, challengeStatus: .isNotStarted),
//    Challenge(name: "Batch Cooking", icon: "dishes", level: .hard, description: "Préparer des repas pour toute la semaine en une seule session de cuisine", points: 180, challengeStatus: .isNotStarted),
//    Challenge(name: "Défi zéro déchet", icon: "stew-1", level: .hard, description: "Cuisiner un repas en générant le moins de déchets possible", points: 170, challengeStatus: .isNotStarted),
//    Challenge(name: "Petit-déjeuner complet", icon: "coffee-maker", level: .easy, description: "Créer un petit-déjeuner sain et gourmand", points: 80, challengeStatus: .isNotStarted),
//    Challenge(name: "Dîner romantique", icon: "dish", level: .medium, description: "Préparer un dîner raffiné pour une occasion spéciale", points: 140, challengeStatus: .isNotStarted),
//    Challenge(name: "Un menu monochrome", icon: "potatoes-2", level: .medium, description: "Cuisiner un plat ou un menu avec des ingrédients de la même couleur", points: 120, challengeStatus: .isNotStarted),
//    Challenge(name: "Revisiter un plat classique", icon: "Chef hat", level: .medium, description: "Donner une touche moderne à un plat traditionnel", points: 130, challengeStatus: .isNotStarted),
//    Challenge(name: "Pain maison", icon: "bread", level: .hard, description: "Faire son propre pain sans machine à pain. À vos biscottos !", points: 160, challengeStatus: .isNotStarted),
//    Challenge(name: "Un plat 100% local et de saison", icon: "groceries", level: .medium, description: "Cuisiner uniquement avec des ingrédients produits localement et de saison", points: 140, challengeStatus: .isNotStarted),
//    Challenge(name: "Légumes oubliés", icon: "celeri", level: .medium, description: "Les légumes oubliés sont de bons produits : essaie de faire des recettes avec l'un d'eux comme ingrédient principal ! Savais-tu que le poireau avait un ancêtre ?", points: 200, challengeStatus: .isNotStarted)
//]
