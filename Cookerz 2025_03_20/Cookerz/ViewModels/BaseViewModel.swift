//
//  BaseViewModel.swift
//  Cookerz
//
//  Created by apprenant87 on 13/03/2025.
//

import Foundation
import Observation

class BaseViewModel: ObservableObject {
    
    
    //  MARK: - App data
    
    @Published var usersVM = users
    @Published var postsVM = userPosts
    @Published var ateliersVM = ateliers
    @Published var recipesVM = recipes
    
    //    MARK: - currrentuser
    
    @Published var user: User = joseph
    
    @Published var rewardPoints: Int = 54
    
    var abonnements: [User] {
        usersVM.filter { user.listFollowedId.contains($0.id) }
    }
    
    var suivis: [User] {
        usersVM.filter { user.listFollowersId.contains($0.id) }
    }
    
    var recipeCreatorUser : [Recipe] {
        recipesVM.filter ({$0 .creatorId == user.id})
    }
    //MARK: - recipes
    
    var userFavoriteRecipes: [Recipe]
    {
        user.listRecipes.filter ({$0 .isLiked == true})
    }
    
    func toggleFavoriteRecipe(recipe: Recipe) {
        if let index = user.listRecipes.firstIndex(where: { $0.id == recipe.id }) {
            user.listRecipes[index].isLiked.toggle()
            
            if !user.listRecipes[index].isLiked {
                user.listRecipes.remove(at: index)
            }
        } else {
            user.listRecipes.append(recipe)
            if let index = user.listRecipes.firstIndex(where: { $0.id == recipe.id }) {
                user.listRecipes[index].isLiked = true
            }
        }
    }
    

    //MARK: - challenges
    
    @Published var allChallenges: [Challenge] = challenges
    
    func challengeStatusToggle(challenge:Challenge) {
        
        if challenge.challengeStatus == .isNotStarted {
            if !user.listChallenges.contains(where: { $0.id == challenge.id }) {
                user.listChallenges.append(challenge)
            }
            
            if let index = user.listChallenges.firstIndex(where: { $0.id == challenge.id }) {
                user.listChallenges[index].challengeStatus = .onGoing
            }
            if let index = allChallenges.firstIndex(where: { $0.id == challenge.id }) {
                allChallenges[index].challengeStatus = .onGoing
            }
            
            print("\(challenge.name) : \(challenge.challengeStatus)\n")
            
        } else if challenge.challengeStatus == .onGoing {
            if let index = user.listChallenges.firstIndex(where: { $0.id == challenge.id }) {
                user.listChallenges[index].challengeStatus = .isFinished
            }
            if let index = allChallenges.firstIndex(where: { $0.id == challenge.id }) {
                allChallenges[index].challengeStatus = .isFinished
            }
            print("\(challenge.name) : \(challenge.challengeStatus)\n")
        } else if challenge.challengeStatus == .isFinished  {
            if let index = user.listChallenges.firstIndex(where: { $0.id == challenge.id }) {
                user.listChallenges[index].challengeStatus = .isNotStarted
            }
            if let index = allChallenges.firstIndex(where: { $0.id == challenge.id }) {
                allChallenges[index].challengeStatus = .isNotStarted
            }
            print("\(challenge.name) : \(challenge.challengeStatus)\n")
            //le challenge.challengeStatus ne change pas car on ne change que dans le baseViewModel
        }
        
        for challenge in user.listChallenges {
            print("baseViewModel user.listChallenge \(challenge.name) : \(challenge.challengeStatus)")
        }
        for challenge in onGoingChallenges {
            print("baseViewModel user.onGoingChallenge \(challenge.name) : \(challenge.challengeStatus)")
        }
    }
    
    var onGoingChallenges : [Challenge] {
        user.listChallenges.filter({$0 .challengeStatus == .onGoing})
    }
    
    var finishedChallenges : [Challenge] {
        user.listChallenges.filter({$0 .challengeStatus == .isFinished})
    }
    
    var numberFinishedChallenges : Int {
        finishedChallenges.count
    }
    
    var totalPointsGained : Int {
        var total : Int = 0
        for challenge in finishedChallenges {
            total += challenge.points
        }
        return total
    }
    
    //MARK: - rewards
    
    var badgesGained : Badge {
        switch numberFinishedChallenges {
        case 1...9 :
            return .newbie
        case 10...24  :
            return .intermediaire
        case 25... :
            return .confirmed
        default:
            return .noBadge
        }
    }
    
    var rewardsUsed : [Reward] {
        user.rewardsUsed
    }
    
    var totalPointsUsed: Int {
        var total: Int = 0
        for reward in user.rewardsUsed {
            total += reward.points
        }
        return total
    }
    
    func toggleRewardUsed(reward: Reward) {
        if !user.rewardsUsed.contains(where: { $0.id == reward.id }) {
            user.rewardsUsed.append(reward)
        }else {
            if let index = user.rewardsUsed.firstIndex(where: { $0.id == reward.id }) {
                user.rewardsUsed.remove(at: index)
            }
        }
    }
    
    var currentPoints : Int {
        totalPointsGained - totalPointsUsed
    }
    
    //MARK: -  add recipes
    
    @Published var selectedPart: RecipeEnum = .ingredients
    @Published var recipeTitle: String = ""
    @Published var recipeImage: String? = nil
    
    @Published var selectedRecipeTypes: [RecipeType] = []
    
    @Published var recipeTimeHours: Int = 0
    @Published var recipeTimeMinutes: Int = 0
    @Published var recipedifficulty: Level = .defaultdifficulty
    @Published var recipePortionNb: Int = 1
    
    @Published var listIngredients: [Ingredient] = []
    @Published var newIngredient: Ingredient = ingredientsBase[0]
    @Published var newIngredientQuantity: String = ""
    @Published var newIngredientUnit: IngredientUnit = .gramme
    
    @Published var listUstensils: [Ustensil] = []
    @Published var newUstensilType: UstensilType = .cookerMachine
    @Published var newUstensilName: String = ""
    
    @Published var listSteps: [String] = []
    @Published var newStep: String = ""
    

    var isFormComplete: Bool {
        return recipeImage != nil
        && !recipeTitle.isEmpty
        && !selectedRecipeTypes.isEmpty
        && (recipeTimeHours > 0 || recipeTimeMinutes > 0)
        && recipedifficulty != .defaultdifficulty
        && !listIngredients.isEmpty
        && !listSteps.isEmpty
    }
    
    func addIngredient() {
        if let quantity = Double(newIngredientQuantity), !newIngredientQuantity.isEmpty {
            listIngredients.append(Ingredient(name: newIngredient.name, type: newIngredient.type, quantity: quantity, unit: newIngredientUnit))
            newIngredientQuantity = ""
        }
    }
    
    func removeIngredient(at index: Int) {
        listIngredients.remove(at: index)
    }
    
    func addStep() {
        if !newStep.isEmpty {
            listSteps.append(newStep)
            newStep = ""
        }
    }
    
    func removeStep(at index: Int) {
        listSteps.remove(at: index)
    }
    

    func postRecipe(dismiss: @escaping () -> Void) {
 
        let newRecipe = Recipe(
            creatorId: user.id,
            title: recipeTitle,
            image: recipeImage!,
            type: selectedRecipeTypes,
            portion: recipePortionNb,
            durationHours: recipeTimeHours,
            durationMinutes: recipeTimeMinutes,
            level: recipedifficulty,
            likes: 0,
            ingredients: listIngredients,
            ustensils: listUstensils,
            steps: listSteps,
            isLiked: false
        )
        

        recipesVM.insert(newRecipe, at: 0)
        print(recipesVM)
        

        dismiss()
    }
    
    @Published var isGalleryPermissionRequested: Bool = false
}

//    func toggleFavoriteRecipe(recipe: Recipe) {
//        if !user.listRecipes.contains(where: { $0.id == recipe.id }) {
//            user.listRecipes.append(recipe)
//
//            if let index = user.listRecipes.firstIndex(where: { $0.id == recipe.id }) {
//                user.listRecipes[index].isLiked.toggle()
//            } else {
//                if user.listRecipes.contains(where: { $0.id == recipe.id }) {
//                    user.listRecipes.removeAll(where: { $0.id == recipe.id })}
//                if let index = user.listRecipes.firstIndex(where: { $0.id == recipe.id }) {
//                    user.listRecipes[index].isLiked.toggle()
//                }
//            }
//        }
//    }

//    func followButton(){
//
//        let index = usersVM.firstIndex(where: { $0.id == user.id })
//            if let index = index {
////       verifier si user id est ds les followers
//
//                if baseViewModel.user.listFollowedId.contains(baseViewModel.user.id) {
//
//                       baseViewModel.user.listFollowedId.removeAll { $0 == baseViewModel.user.id }
//                   } else {
//
//                       baseViewModel.user.listFollowedId.append(baseViewModel.user.id)
//                   }
//
//            usersVM[index].listFollowedId.append(user.id)
//
//        }
//
//    }

//    func challengeStatus (challenge:Challenge) -> ChallengeStatus {
//
//        if !user.listChallenges.contains(where: { $0.id == challenge.id }) {
//            user.listChallenges.append(challenge)
//
//            if let index = user.listChallenges.firstIndex(where: { $0.id == challenge.id }) {
//                user.listChallenges[index].challengeStatus = .onGoing
//            }
//
//        } else if challenge.challengeStatus == .onGoing {
//
//            if let index = user.listChallenges.firstIndex(where: { $0.id == challenge.id }) {
//                user.listChallenges[index].challengeStatus = .isFinished
//            }
//        } else if challenge.challengeStatus == .isFinished  {
//
//            if let index = user.listChallenges.firstIndex(where: { $0.id == challenge.id }) {
//                user.listChallenges[index].challengeStatus = .isNotStarted
//            }
//        }
//        return challenge.challengeStatus
//    }
