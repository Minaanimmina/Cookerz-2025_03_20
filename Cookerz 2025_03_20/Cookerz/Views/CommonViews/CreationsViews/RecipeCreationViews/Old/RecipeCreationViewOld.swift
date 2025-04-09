////
////  Untitled.swift
////  Cookerz
////
////  Created by apprenant98 on 14/03/2025.
////
//
//import SwiftUI
//
//struct RecipeCreationView: View {
//    
//    @State private var isTimePickerPresented = false
//    @State private var isIngredientPickerPresented = false
//    @State private var isIngredientUnitPickerPresented = false
//    @State private var isUstensilTypePickerPresented = false
//    
//    @State private var ingredientChosen : Bool = false
//    @State private var ustensilChosen : Bool = false
//    
//    @State var creatorId: UUID = users[0].id
//    
//    @State var recipeTitle: String = ""
//    @State var recipeImage: String? = nil
//    
//    @State var recipeTimeHours: Int = 0
//    @State var recipeTimeMinutes: Int = 0
//    
//    @State var recipedifficulty : Level = .defaultdifficulty
//    
//    @State var recipePortionNb: Int = 1
//    
//    @State var listIngredients: [Ingredient] = []
//    @State var newIngredient : Ingredient = ingredientsBase[0]
//    @State var newIngredientQuantity : String = ""
//    @State var newIngredientUnit : IngredientUnit = .gramme
//    
//    @State var listUstensils: [Ustensil] = []
//    @State var newUstensilType: UstensilType = .cookerMachine
//    @State var newUstensilName : String = ""
//    
//    @State var listSteps: [String] = []
//    @State var newStep : String = ""
//    
//    @State var selectedPart: RecipeEnum = .ingredients
//    
//    // Declare a separate regular property instead of a computed one
//    private var isFormComplete: Bool {
//        return recipeImage != nil
//            && !recipeTitle.isEmpty
//            && (recipeTimeHours > 0 || recipeTimeMinutes > 0)
//            && recipedifficulty != .defaultdifficulty
//            && !listIngredients.isEmpty
//            && !listSteps.isEmpty
//            && listIngredients.allSatisfy { $0.quantity ?? 0 > 0 } // Check if all ingredients have quantity > 0
//    }
//    
//    var body: some View {
//        ZStack (alignment: .bottom){
//            Color.white.ignoresSafeArea()
//            
//            ScrollView {
//                ZStack(alignment: .top) {
//                    ZStack {
//                        if recipeImage == nil {
//                            Rectangle()
//                                .fill(Color.grisFond)
//                                .frame(width: UIScreen.main.bounds.width, height: 200)
//                                .ignoresSafeArea()
//                        }
//                        else {
//                            BackgroungImage(imageName : recipeImage!)
//                        }
//                        Button {
//                            recipeImage = "cake_sans_lactose"
//                        } label: {
//                            VStack {
//                                Image("addPhoto")
//                                if recipeImage == nil {
//                                    Text("Ajouter une photo")
//                                        .foregroundStyle(.black)
//                                } else {
//                                    Text("Changer la photo")
//                                        .foregroundStyle(.black)
//                                }
//                            }
//                            .padding()
//                            .background(Color.white.opacity(0.5))
//                            .cornerRadius(10)
//                            
//                        }
//                    }
//                    
//                    VStack(alignment: .leading, spacing: 10) {
//                        Rectangle()
//                            .fill(Color.clear)
//                            .frame(width: UIScreen.main.bounds.width, height: 180)
//                        
//                        VStack (spacing : 8 ) {
//                            HStack {
//                                TextField("Nom de la recette", text: $recipeTitle)
//                                    .font(.PoppinsTitle3Medium())
//                            }
//                            .padding(.vertical, 10)
//                            
//                            HStack(spacing: 8) {
//                                Button {
//                                    withAnimation() {
//                                        isTimePickerPresented.toggle()
//                                    }
//                                } label :{
//                                    RecipeCreationTimeView(recipeTimeHours: $recipeTimeHours, recipeTimeMinutes: $recipeTimeMinutes)
//                                }
//                                
//                                CreationDifficultyView(recipedifficulty: $recipedifficulty)
//                            }
//                            
//                            RecipeDoublePickerView(selectedPart : $selectedPart)
//                            
//                            if selectedPart == .ingredients {
//                                RecipeCreationStuffView(
//                                    numberPortionChosen: $recipePortionNb,
//                                    isIngredientPickerPresented : $isIngredientPickerPresented, ingredientChosen : $ingredientChosen, listIngredients : $listIngredients, newIngredient : $newIngredient,
//                                    newIngredientQuantity: $newIngredientQuantity,
//                                    isIngredientUnitPickerPresented : $isIngredientUnitPickerPresented,
//                                    newIngredientUnit: $newIngredientUnit,  isUstensilTypePickerPresented: $isUstensilTypePickerPresented, ustensilChosen : $ustensilChosen, listUstensils: $listUstensils,  newUstensilType: $newUstensilType, newUstensilName : $newUstensilName)
//                            } else {
//                                CreationListStepsView(listSteps: $listSteps)
//                                
//                                newStepView(listSteps : $listSteps, newStep : $newStep)
//                            }
//                            
//                            Button {
//                                recipes.append(Recipe(
//                                    creatorId : creatorId ,
//                                    title: recipeTitle,
//                                    image : recipeImage!,
//                                    type : [],
//                                    portion: recipePortionNb,
//                                    durationHours: recipeTimeHours,
//                                    durationMinutes: recipeTimeMinutes,
//                                    level : recipedifficulty,
//                                    likes : 0,
//                                    ingredients: listIngredients,
//                                    ustensils: listUstensils,
//                                    steps: listSteps))
//                                print(recipes)
//                            } label: {
//                                HStack {
//                                    Text("Poster la recette")
//                                        .foregroundStyle(.white)
//                                }
//                                .padding()
//                                .frame(maxWidth: .infinity)
//                                .background(isFormComplete ? Color.red400 : Color.gray) // Disable button if form is not complete
//                                .cornerRadius(20)
//                                .padding(.top, 24)
//                            }
//                            .disabled(!isFormComplete) // Disable button if form is not complete
//                        }
//                        .padding(20)
//                        .padding(.bottom, 20)
//                        .background(Color.white)
//                        .cornerRadius(20)
//                        
//                    }
//                }
//            }
//            
//        }
//        if isTimePickerPresented {
//            PickerTimeModalView(TimeHours: $recipeTimeHours, TimeMinutes: $recipeTimeMinutes, isPickerPresented: $isTimePickerPresented)
//        }
//        if isIngredientPickerPresented {
//            PickerIngredientView(isPickerPresented: $isIngredientPickerPresented, ingredientChosen: $ingredientChosen, ingredient: $newIngredient)
//        }
//        if isIngredientUnitPickerPresented {
//            PickerIngredientUnitView(isPickerPresented: $isIngredientUnitPickerPresented, ingredientUnit: $newIngredientUnit)
//        }
//        if isUstensilTypePickerPresented {
//            PickerUstensilTypeView(isPickerPresented: $isUstensilTypePickerPresented, ustensilChosen: $ustensilChosen, ustensilType: $newUstensilType)
//        }
//    }
//}
//
//
//
//#Preview {
//    RecipeCreationView()
//}
//
//struct RecipeCreationTimeView: View {
//    @Binding var recipeTimeHours: Int
//    @Binding var recipeTimeMinutes: Int
//    
//    var body: some View {
//        VStack {
//            Image("minuteur")
//            Text("\(recipeTimeHours) h \(recipeTimeMinutes) mn")
//                .foregroundStyle(.black)
//        }
//        .padding(16)
//        .frame(maxWidth: .infinity)
//        .background(Color.red50)
//        .cornerRadius(16)
//    }
//}
//
//
//
//
//
//
//struct RecipeCreationStuffView: View {
//    
//    
//    @Binding var numberPortionChosen : Int
//    
//    @Binding var isIngredientPickerPresented : Bool
//    @Binding var ingredientChosen : Bool
//    
//    @Binding var listIngredients : [Ingredient]
//    @Binding var newIngredient : Ingredient
//    @Binding var newIngredientQuantity : String
//    @Binding var isIngredientUnitPickerPresented : Bool
//    @Binding var newIngredientUnit : IngredientUnit
//    
//    
//    
//    @Binding var isUstensilTypePickerPresented : Bool
//    @Binding var ustensilChosen : Bool
//    
//    @Binding var listUstensils : [Ustensil]
//    @Binding var newUstensilType : UstensilType
//    @Binding var newUstensilName : String
//    
//    var body: some View {
//        VStack (alignment: .leading) {
//            
//            HStack {
//                Text("Ingredients")
//                    .font(.PoppinsTitle3Medium())
//                
//                Spacer()
//                
//                PortionsView(numberPortionChosen: $numberPortionChosen)
//            }
//            
//            CreationListIngredientsView(listIngredients: $listIngredients
//                                        ,isIngredientUnitPickerPresented : $isIngredientUnitPickerPresented, newIngredientUnit: $newIngredientUnit)
//            ZStack {
//                Rectangle()
//                    .fill(Color.white)
//                    .frame(width: .infinity, height: 60)
//                    .cornerRadius(20)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 20)
//                            .stroke(Color.grisBordure, lineWidth: 1))
//                HStack {
//                    Button {
//                        isIngredientPickerPresented.toggle()
//                    }label :{
//                        HStack {
//                            if ingredientChosen == false {
//                                Text("Ingredient")
//                            } else {
//                                HStack {
//                                    Image(newIngredient.type.Icon)
//                                        .resizable()
//                                        .frame(width: 20, height: 20)
//                                    Text(newIngredient.name)
//                                }
//                            }
//                        }
//                        .padding()
//                        .frame(maxWidth: .infinity)
//                        .background(Color.red50)
//                        .cornerRadius(100)
//                    }
//                    Spacer()
//                 
//                    
//                    
//                    Button{
//                        if ingredientChosen {
//                            listIngredients.append(Ingredient(name: newIngredient.name, type: newIngredient.type, quantity: 0.0 , unit : newIngredientUnit ))
//                            ingredientChosen = false
//                            newIngredientQuantity = ""
//                        }
//                        
//                    }label: {
//                        Image("add_button")
//                    }
//                }
//                .padding(.horizontal, 4)
//            }
//            
//            Text("Ustensils")
//                .font(.PoppinsTitle3Medium())
//            
//            CreationListUstensilsView(listUstensils: $listUstensils)
//            
//            HStack {
//                Button {
//                    isUstensilTypePickerPresented.toggle()
//                }label :{
//                    HStack {
//                        if ustensilChosen == false {
//                            Text("Ajouter nouvel ustensil")
//                        }else{
//                            Image(newUstensilType.Icon)
//                                .resizable()
//                                .frame(width: 20, height: 20)
//                            Text(newUstensilType.name)
//                        }
//                    }
//                    .padding()
//                    .frame(maxWidth : .infinity)
//                    .background(Color.red50)
//                    .cornerRadius(100)
//                }
//                Spacer()
//                
//                Button{
//                    if ustensilChosen {
//                        listUstensils.append(Ustensil( name : newUstensilName, type: newUstensilType))
//                        ustensilChosen = false
//                    }
//                }label: {
//                    Image("add_button")
//                }
//            }
//        }
//    }
//}
//
//
//struct CreationListIngredientsView: View {
//    @Binding var listIngredients: [Ingredient]
//    @Binding var isIngredientUnitPickerPresented: Bool
//    @Binding var newIngredientUnit: IngredientUnit
//    
//    // This function ensures we only allow numbers and one decimal point
//    func isValidQuantity(_ value: String) -> Bool {
//        // Only numbers and one decimal point allowed
//        let regex = "^[0-9]*\\.?[0-9]*$"  // Matches numbers with one optional decimal point
//        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
//        return predicate.evaluate(with: value)
//    }
//    
//    var body: some View {
//        ForEach(listIngredients.indices, id: \.self) { index in
//            HStack {
//                // Ingredient Icon
//                Image(listIngredients[index].type.Icon)
//                    .resizable()
//                    .frame(width: 24, height: 24)
//                
//                // Ingredient Name (static)
//                Text(listIngredients[index].name)
//                    .font(.body)
//                    .padding(.leading, 8)
//                
//                Spacer()
//                
//                
//                
//                
//                // TextField for editing the Ingredient quantity
//                TextField("Quantité", text: Binding (
//                    get: {
//                        // Format the quantity to string and return
//                        String(format: "%.2f", listIngredients[index].quantity ?? 0)
//                    },
//                    set: { newValue in
//                        // Check if the new value is valid before updating
//                        if isValidQuantity(newValue) {
//                            // Convert to Double and set if valid
//                            if let newQuantity = Double(newValue) {
//                                listIngredients[index].quantity = newQuantity
//                            }
//                        }
//                    }
//                ))
//                .keyboardType(.decimalPad)  // Only allow numbers and decimal point
//                .onChange(of: listIngredients[index].quantity ?? 0) { newValue in
//                    // Enforce that quantity cannot be less than zero
//                    if newValue < 0 {
//                        listIngredients[index].quantity = 0
//                    }
//                }
//                .frame(width: 80)
//                .padding(8)
//                .background(Color.grisFond)
//                .cornerRadius(10)
//                
//                // Button to change the Ingredient Unit
//                Button {
//                    isIngredientUnitPickerPresented.toggle()
//                } label: {
//                    Text(listIngredients[index].unit != nil ? listIngredients[index].unit!.initial : "Unité")
//                        .padding()
//                        .background(Color.red50)
//                        .cornerRadius(100)
//                }
//                
//                // Button to delete the Ingredient from the list
//                Button {
//                    listIngredients.remove(at: index)
//                } label: {
//                    ButtonPortionView(textSymbol: "x")
//                }
//            }
//            .padding(.vertical)
//        }
//    }
//}
//
//
//
//
//
//struct CreationListStepsView: View {
//    @Binding var listSteps: [String]
//    
//    var body: some View {
//        ForEach(listSteps, id: \.self) { step in
//            HStack {
//                HStack {
//                    Text("\(listSteps.firstIndex(of: step)! + 1)")
//                        .font(.PoppinsSubhead())
//                }
//                .frame(width: 30, height: 30)
//                .background(Color.red50)
//                .cornerRadius(100)
//                
//                Spacer()
//                
//                Text(step)
//                    .font(.PoppinsFootnote())
//                
//                Button {
//                    // Remove the step from the list
//                    if let index = listSteps.firstIndex(of: step) {
//                        listSteps.remove(at: index)
//                        
//                    }
//                } label: {
//                    ButtonPortionView(textSymbol: "x")
//                }
//            }
//            .padding(.vertical)
//        }
//    }
//}
//
//
//struct newStepView: View {
//    @Binding var listSteps: [String]
//    @Binding var newStep: String
//    var body: some View {
//        HStack {
//            Button {
//                if !newStep.isEmpty {
//                    listSteps.append(newStep)
//                    newStep = ""
//                }
//            } label: {
//                Image("add_button")
//            }
//            
//            ZStack(alignment: .topLeading) {
//                TextEditor(text: $newStep)
//                    .font(.caption)
//                    .cornerRadius(8)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 8.0)
//                            .stroke(.black, lineWidth: 1))
//                    
//                
//                if newStep.isEmpty {
//                    Text("Ajouter une étape")
//                        .foregroundColor(.black)
//                        .font(.subheadline)
//                        .padding([.top, .leading], 8)
//                }
//            }
//            .frame(width: .infinity, height: 150)
//            .padding(.horizontal, 8)
//            .cornerRadius(8)
//            
//        }
//    }
//}
//
//
//struct CreationListUstensilsView: View {
//    @Binding var listUstensils: [Ustensil]
//    
//    var body: some View {
//        ForEach(listUstensils.indices, id: \.self) { index in
//            HStack {
//                // Ustensil Icon
//                Image(listUstensils[index].type.Icon)
//                    .resizable()
//                    .frame(width: 24, height: 24)
//                
//                // TextField for editing the Ustensil name
//                TextField("Nom de l'ustensil", text: $listUstensils[index].name)
//                    .font(.body)
//                    .padding(8)
//                    .background(Color.grisFond)
//                    .cornerRadius(10)
//                    .frame(maxWidth: .infinity)
//                
//                // Button to delete the Ustensil
//                Button {
//                    // Remove the Ustensil from the list
//                    listUstensils.remove(at: index)
//                } label: {
//                    ButtonPortionView(textSymbol: "x")
//                }
//            }
//            .padding(.vertical)
//        }
//    }
//}
