//
//  AtelierCreationViewModel.swift
//  Cookerz
//
//  Created by apprenant98 on 17/03/2025.
//



import Foundation

class AtelierCreationViewModel: ObservableObject {
    @Published var selectedPart: AtelierEnum = .description
    @Published var atelierTitle: String = ""
    @Published var atelierImage: String? = nil
    
    @Published var atelierDateChosen : Bool = false
    @Published var atelierDate: Date = Date()
    
    @Published var atelierDifficulty: Level = .defaultdifficulty
    @Published var atelierPortionNb: Int = 1
    
    @Published var listIngredients: [Ingredient] = []
    @Published var newIngredient: Ingredient = ingredientsBase[0]
    @Published var newIngredientQuantity: String = ""
    @Published var newIngredientUnit: IngredientUnit = .gramme
    
    @Published var listUstensils: [Ustensil] = []
    @Published var newUstensilType: UstensilType = .cookerMachine
    @Published var newUstensilName: String = ""
    
    @Published var atelierDescription: String = ""
    

    var isFormComplete: Bool {
        return atelierImage != nil
        && !atelierTitle.isEmpty
        && atelierDateChosen == true
        && atelierDifficulty != .defaultdifficulty
        && !atelierDescription.isEmpty
        && (!listIngredients.isEmpty || !listUstensils.isEmpty)
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
    
    func postAtelier(dismiss: @escaping () -> Void) {
        let newAtelier = Atelier(
            creatorId: UUID(),
            title: atelierTitle,
            image: atelierImage!,
            date: atelierDate,
            portion : atelierPortionNb,
            level: atelierDifficulty,
            description: atelierDescription,
            ingredients: listIngredients,
            ustensils: listUstensils,
            usersRegistered: [users[0].id],
            nbSeats: 10
        )
        
        ateliers.insert(newAtelier, at : 0)
        print(ateliers)
        dismiss()
    }
    
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d/MM - HH:mm"
        return dateFormatter.string(from: atelierDate)
    }
}
