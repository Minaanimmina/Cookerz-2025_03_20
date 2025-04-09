//
//  RecipesDataBase.swift
//  Cookerz
//
//  Created by apprenant98 on 09/03/2025.
//

var recipes = [risottoChampignons, quicheEpinards, curryVegetarien, chiliSinCarneVegan, falafelsVeganMaison, pancakesVeganBanane, smoothieBowlSansLactose, cakeSansLactoseAuxAmandes, saladeCesarSansLactose, padThaiFacile, gyozasMaison, soupePhoVietnamienne, pizzaMargherita, spaghettiCarbonara, tiramisuClassique, lasagnesLesVraies, crepesBretonnes]

var risottoChampignons = Recipe(
    creatorId: users[0].id,title: "Risotto aux champignons",image: "risotto_champignons",
    type: [.vegetarien],
    portion: 4,
    durationHours: 0,
    durationMinutes: 40,
    level: .easy,
    likes: 25,
    ingredients: recipe0Ingredients,
    ustensils: recipe0Ustensils,
    steps: ["Préparer le bouillon", "Faire cuire le riz", "Ajouter les champignons"],
    isLiked: false
)

var quicheEpinards = Recipe(
    creatorId: users[0].id,
    title: "Quiche aux épinards",
    image: "quiche_epinards",
    type: [.vegetarien],
    portion: 4,
    durationHours: 0,
    durationMinutes: 50,
    level: .easy,
    likes: 80,
    ingredients: recipe0Ingredients,
    ustensils: recipe0Ustensils,
    steps: [
        "Préparer la pâte",
        "Mélanger les épinards",
        "Cuire au four"
    ],
    isLiked: false
)

var curryVegetarien = Recipe(
    creatorId: users[2].id,
    title: "Curry végétarien",
    image: "curry_vege",
    type: [.vegetarien],
    portion: 4,
    durationHours: 0,
    durationMinutes: 45,
    level: .medium,
    likes: 150,
    ingredients: recipe0Ingredients,
    ustensils: recipe0Ustensils,
    steps: [
        "Découper les légumes",
        "Faire mijoter avec les épices",
        "Servir chaud"
    ],
    isLiked: false
)


var chiliSinCarneVegan = Recipe(
    creatorId: users[0].id,
    title: "Chili sin carne vegan",
    image: "chili_sin_carne",
    type: [.vegan],
    portion: 4,
    durationHours: 0,
    durationMinutes: 40,
    level: .medium,
    likes: 75,
    ingredients: recipe0Ingredients,
    ustensils: recipe0Ustensils,
    steps: [
        "Faire revenir légumes et épices",
        "Ajouter haricots rouges et sauce tomate",
        "Laisser mijoter doucement"
    ],
    isLiked: false
)


var falafelsVeganMaison = Recipe(
    creatorId: users[0].id,
    title: "Falafels vegan maison",
    image: "falafels_vegan",
    type: [.vegan],
    portion: 4,
    durationHours: 1,
    durationMinutes: 0,
    level: .medium,
    likes: 90,
    ingredients: recipe0Ingredients,
    ustensils: recipe0Ustensils,
    steps: [
        "Préparer les pois chiches",
        "Mixer avec épices et herbes",
        "Former et cuire les falafels au four ou à la poêle"
    ],
    isLiked: false
)


var pancakesVeganBanane = Recipe(
    creatorId: users[0].id,
    title: "Pancakes vegan à la banane",
    image: "pancakes_vegan",
    type: [.vegan],
    portion: 2,
    durationHours: 0,
    durationMinutes: 20,
    level: .easy,
    likes: 120,
    ingredients: recipe0Ingredients,
    ustensils: recipe0Ustensils,
    steps: [
        "Écraser les bananes",
        "Préparer la pâte à pancakes vegan",
        "Cuire à la poêle et garnir"
    ],
    isLiked: false
)



var smoothieBowlSansLactose = Recipe(
    creatorId: users[3].id,
    title: "Smoothie bowl sans lactose",
    image: "smoothie_bowl",
    type: [.dairyFree],
    portion: 2,
    durationHours: 0,
    durationMinutes: 10,
    level: .easy,
    likes: 80,
    ingredients: recipe0Ingredients,
    ustensils: recipe0Ustensils,
    steps: [
        "Mixer fruits et lait végétal",
        "Ajouter toppings"
    ],
    isLiked: false
)


var cakeSansLactoseAuxAmandes = Recipe(
    creatorId: users[4].id,
    title: "Cake sans lactose aux amandes",
    image: "cake_sans_lactose",
    type: [.dairyFree],
    portion: 6,
    durationHours: 1,
    durationMinutes: 15,
    level: .medium,
    likes: 45,
    ingredients: recipe0Ingredients,
    ustensils: recipe0Ustensils,
    steps: [
        "Préparer la pâte sans lactose",
        "Cuisson au four"
    ],
    isLiked: false
)


var saladeCesarSansLactose = Recipe(
    creatorId: users[5].id,
    title: "Salade César sans lactose",
    image: "salade_cesar",
    type: [.dairyFree],
    portion: 4,
    durationHours: 0,
    durationMinutes: 20,
    level: .easy,
    likes: 32,
    ingredients: recipe0Ingredients,
    ustensils: recipe0Ustensils,
    steps: [
        "Préparer la salade",
        "Ajouter la vinaigrette sans lactose"
    ],
    isLiked: false
)



var padThaiFacile = Recipe(
    creatorId: users[6].id,
    title: "Pad Thaï facile",
    image: "pad_thai",
    type: [.asian],
    portion: 3,
    durationHours: 0,
    durationMinutes: 30,
    level: .easy,
    likes: 90,
    ingredients: recipe0Ingredients,
    ustensils: recipe0Ustensils,
    steps: ["Faire cuire les nouilles", "Ajouter les légumes et sauce soja"],
    isLiked: false
)


var gyozasMaison = Recipe(
    creatorId: users[10].id,
    title: "Gyozas maison",
    image: "gyozas",
    type: [.asian],
    portion: 4,
    durationHours: 0,
    durationMinutes: 50,
    level: .medium,
    likes: 110,
    ingredients: recipe0Ingredients,
    ustensils: recipe0Ustensils,
    steps: ["Préparer la farce", "Façonner les gyozas", "Cuire à la poêle"],
    isLiked : false
)

var soupePhoVietnamienne = Recipe(
    creatorId: users[7].id,
    title: "Soupe Pho Vietnamienne",
    image: "soupe_pho",
    type: [.asian],
    portion: 4,
    durationHours: 2,
    durationMinutes: 0,
    level: .medium,
    likes: 60,
    ingredients: recipe0Ingredients,
    ustensils: recipe0Ustensils,
    steps: ["Préparer le bouillon", "Ajouter nouilles et viande"],
    isLiked: false
)




// Recettes italiennes
var pizzaMargherita = Recipe(
    creatorId: users[9].id,
    title: "Pizza Margherita",
    image: "pizza_margherita",
    type: [.italian],
    portion: 4,
    durationHours: 0,
    durationMinutes: 30,
    level: .easy,
    likes: 150,
    ingredients: recipe0Ingredients,
    ustensils: recipe0Ustensils,
    steps: ["Étaler la pâte", "Ajouter garniture", "Cuire au four"],
    isLiked: false
)


var spaghettiCarbonara = Recipe(
    creatorId: users[10].id,
    title: "Spaghetti Carbonara",
    image: "spaghetti_carbo",
    type: [.italian],
    portion: 4,
    durationHours: 0,
    durationMinutes: 25,
    level: .medium,
    likes: 88,
    ingredients: recipe0Ingredients,
    ustensils: recipe0Ustensils,
    steps: ["Cuire les pâtes", "Préparer la sauce carbonara", "Mélanger et servir chaud"],
    isLiked: false
)

var tiramisuClassique = Recipe(
    creatorId: users[0].id,
    title: "Tiramisu classique",
    image: "tiramisu",
    type: [.italian],
    portion: 6,
    durationHours: 1,
    durationMinutes: 0,
    level: .medium,
    likes: 130,
    ingredients: recipe0Ingredients,
    ustensils: recipe0Ustensils,
    steps: ["Préparer la crème mascarpone", "Monter le tiramisu", "Mettre au frais"],
    isLiked: false
)


var lasagnesLesVraies = Recipe(
    creatorId: users[1].id,
    title: "Lasagnes (les vraies)",
    image: "lasagne",
    type: [.french],
    portion: 6,
    durationHours: 0,
    durationMinutes: 30,
    level: .medium,
    likes: 100,
    ingredients: recipe0Ingredients,
    ustensils: recipe0Ustensils,
    steps: ["Préparer viande", "Montage des lasagnes", "Cuisson au four"],
    isLiked: false
)

var crepesBretonnes = Recipe(
    creatorId: users[0].id,
    title: "Crêpes bretonnes",
    image: "crepes_bretonnes",
    type: [.french],
    portion: 4,
    durationHours: 0,
    durationMinutes: 20,
    level: .easy,
    likes: 200,
    ingredients: recipe0Ingredients,
    ustensils: recipe0Ustensils,
    steps: ["Préparer pâte à crêpes", "Cuire sur bilig ou poêle", "Servir avec garnitures"],
    isLiked: false
)

