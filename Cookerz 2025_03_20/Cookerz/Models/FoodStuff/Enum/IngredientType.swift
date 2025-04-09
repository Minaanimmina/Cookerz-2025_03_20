//
//  IngredientType.swift
//  Cookerz
//
//  Created by apprenant98 on 05/03/2025.
//

import Foundation

enum IngredientType : CaseIterable {
    case fruit
    case vegetable
    case beans
    case herb
    case mushroom
    case nuts
    
    case meat
    case fish
    case seaFood
    
    case egg
    case dairy
    case rice
    case pasta
    case veganDairy
    case flour
    case dough
    case bread
    case dish
    case pastry
    case sugary
    
    case oil
    case vinegar
    case salt
    case pepper
    case sugar
    case cacao
    case spice
    case sauce
    case backingStuff
   
    case liquidBase
    case syrup
    case wine
    case alcohol
   

    
    
    var name : String {
        switch self {
        case .fruit:
            return "Fruit"
        case .vegetable:
            return "Légume"
        case .herb:
            return "Plante"
        case .beans:
            return "Haricot"
        case .mushroom:
            return "Champignon"
        case .nuts:
            return "Noix"
            
            
        case .meat :
            return "Viande"
        case .fish:
            return"Poisson"
        case .seaFood:
            return "Fruits de mer"
            
        case .egg :
            return "Oeuf"
        case .dairy :
            return "Produit laitier"
        case .rice:
            return "Riz"
        case .pasta:
            return "pates"
        case .veganDairy:
             return "Produits laitier vegan"
        case .flour :
            return "Farine"
        case .dough:
            return "pates à cuisson"
        case .bread:
            return "pain"
        case .dish:
            return "plats"
        case .pastry:
            return "patisseries"
        case .sugary:
            return "sucrerie"
      
            
            
        case .oil :
            return "Huile"
        case .vinegar:
            return "vinaigre"
        case .salt :
            return "Sel"
        case .pepper:
            return "Poivre"
        case .sugar :
            return "Sucre"
        case .cacao:
            return "Chocolat"
        case .spice :
            return "Epice"
        case .sauce:
            return "Sauce"
        case.backingStuff:
            return "Elements à patisserie"
            
            
        case .liquidBase :
            return "Liquide"
        case .syrup:
            return "sirop"
        case .wine:
            return "Vin"
        case .alcohol:
            return "Alcool"
        }
    }
    
    var Icon : String {
        switch self {
       
        case .fruit:
            return "banana"
        case .vegetable:
            return "carrot"
        case .herb:
            return "plante"
        case .beans:
            return "beans"
        case .mushroom:
            return "mushroom"
        case .nuts:
            return "seeds"
            
            
        case .meat:
            return "meat"
        case .fish:
            return"fish"
        case .seaFood:
            return "shrimp"
            
            
        case .egg :
            return "egg"
        case .dairy:
            return "dairy"
        case .rice:
            return "rice"
        case .pasta:
            return "pasta"
        case .veganDairy:
             return "dairy"
        case .flour :
            return "flour"
        case .dough:
            return "croissant"
        case .bread:
            return "bread"
        case .dish:
            return "taco"
        case .pastry:
            return "doughnut"
        case .sugary:
            return "jam"
      
            
            
        case .oil:
            return "oil"
        case .vinegar:
            return "oil"
        case .salt :
            return "salt"
        case .pepper:
            return "pepper"
        case .sugar :
            return "sugar"
        case .cacao:
            return "chocolate"
        case .spice :
            return "spices"
        case .sauce:
            return "mustard"
        case.backingStuff:
            return "fullBowl"
            
            
        case .liquidBase :
            return "water"
        case .syrup:
            return "honey"
        case .wine:
            return "glass"
        case .alcohol:
            return "glass_2"
        }
    }
}
