////
////  RecipeCreationViewModel.swift
////  Cookerz
////
////  Created by apprenant98 on 14/03/2025.
////
//
//
//
//import Foundation
//
//class RecipeCreationViewModel: ObservableObject {
//    @Published var selectedPart: RecipeEnum = .ingredients
//    @Published var recipeTitle: String = ""
//    @Published var recipeImage: String? = nil
//    
//    @Published var selectedRecipeTypes: [RecipeType] = []
//    
//    @Published var recipeTimeHours: Int = 0
//    @Published var recipeTimeMinutes: Int = 0
//    @Published var recipedifficulty: Level = .defaultdifficulty
//    @Published var recipePortionNb: Int = 1
//    
//    @Published var listIngredients: [Ingredient] = []
//    @Published var newIngredient: Ingredient = ingredientsBase[0]
//    @Published var newIngredientQuantity: String = ""
//    @Published var newIngredientUnit: IngredientUnit = .gramme
//    
//    @Published var listUstensils: [Ustensil] = []
//    @Published var newUstensilType: UstensilType = .cookerMachine
//    @Published var newUstensilName: String = ""
//    
//    @Published var listSteps: [String] = []
//    @Published var newStep: String = ""
//    
//
//    var isFormComplete: Bool {
//        return recipeImage != nil
//        && !recipeTitle.isEmpty
//        && !selectedRecipeTypes.isEmpty
//        && (recipeTimeHours > 0 || recipeTimeMinutes > 0)
//        && recipedifficulty != .defaultdifficulty
//        && !listIngredients.isEmpty
//        && !listSteps.isEmpty
//    }
//    
//    func addIngredient() {
//        if let quantity = Double(newIngredientQuantity), !newIngredientQuantity.isEmpty {
//            listIngredients.append(Ingredient(name: newIngredient.name, type: newIngredient.type, quantity: quantity, unit: newIngredientUnit))
//            newIngredientQuantity = ""
//        }
//    }
//    
//    func removeIngredient(at index: Int) {
//        listIngredients.remove(at: index)
//    }
//    
//    func addStep() {
//        if !newStep.isEmpty {
//            listSteps.append(newStep)
//            newStep = ""
//        }
//    }
//    
//    func removeStep(at index: Int) {
//        listSteps.remove(at: index)
//    }
//    
//
//    func postRecipe(dismiss: @escaping () -> Void) {
// 
//        let newRecipe = Recipe(
//            creatorId: UUID(),
//            title: recipeTitle,
//            image: recipeImage!,
//            type: selectedRecipeTypes,
//            portion: recipePortionNb,
//            durationHours: recipeTimeHours,
//            durationMinutes: recipeTimeMinutes,
//            level: recipedifficulty,
//            likes: 0,
//            ingredients: listIngredients,
//            ustensils: listUstensils,
//            steps: listSteps,
//            isLiked: false
//        )
//        
//
//        recipes.insert(newRecipe, at: 0)
//        print(recipes)
//        
//  
//        dismiss()
//    }
//}
