import SwiftUI

struct FilterRecipesView: View {
    
    @Binding var selectedRecipeTypes: [RecipeType]
    @Binding var maxDuration: (hours: Int, minutes: Int)?
    @Binding var minDifficulty: Int?
    
    @State private var tempRecipeTypes: [RecipeType] = []
    @State private var tempMaxDuration: (hours: Int, minutes: Int) = (0, 30)
    @State private var tempMinDifficulty: Int = 1

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(alignment: .leading) {
            Text("Filtrer")
                .padding(.leading, 20)
                .padding(.top, 20)
                .font(.PoppinsTitle3Medium())

            // Sélection de la durée
            HStack {
                Text("Durée maximum")
                    .font(.PoppinsBodyMedium())
                    .foregroundStyle(.mediumGray)
                
                Spacer()
                
                HStack {
                    // Picker pour les heures
                    Picker(selection: $tempMaxDuration.hours, label: Text("Heures")) {
                        ForEach(0..<13, id: \.self) { hour in
                            Text("\(hour) h").tag(hour)
                        }
                    }
                    .pickerStyle(WheelPickerStyle()) // Style natif Apple
                    
                    // Picker pour les minutes
                    Picker(selection: $tempMaxDuration.minutes, label: Text("Minutes")) {
                        ForEach(Array(stride(from: 0, through: 55, by: 5)), id: \.self) { minute in
                            Text("\(minute) min").tag(minute)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                }
                .frame(height: 120) // Hauteur du Picker
            }
            .padding(.horizontal, 24)
            
            Divider().padding(.horizontal, 24)
            
            // Difficulté avec les flammes
            HStack {
                Text("Difficulté")
                    .font(.PoppinsBodyMedium())
                    .foregroundStyle(.mediumGray)
                
                Spacer()
                HStack {
                    Button(action: {
                        if tempMinDifficulty > 1 {
                            tempMinDifficulty -= 1
                        }
                    }) {
                        Text("-")
                            .foregroundColor(.black)
                            .frame(width: 40, height: 40)
                            .background(Circle().stroke(Color.grisBordure, lineWidth: 2))
                    }
                    
                    HStack {
                        ForEach(0..<tempMinDifficulty, id: \.self) { _ in
                            FlameDifficulty()
                        }
                    }
                    .frame(width: 130, height: 40)
                    
                    Button(action: {
                        if tempMinDifficulty < 3 {
                            tempMinDifficulty += 1
                        }
                    }) {
                        Text("+")
                            .foregroundColor(.black)
                            .frame(width: 40, height: 40)
                            .background(Circle().stroke(Color.grisBordure, lineWidth: 2))
                    }
                }
            }
            .padding(.horizontal, 24)
            
            Divider()
                .padding(.horizontal, 24)

            RecipeTypeSelectionView(selectedRecipeTypes: $tempRecipeTypes)

            Spacer()
            
            Button {
                selectedRecipeTypes = tempRecipeTypes
                maxDuration = tempMaxDuration
                minDifficulty = tempMinDifficulty
                dismiss()
            } label: {
                Text("Confirmer")
                    .font(.PoppinsSubheadMedium())
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, minHeight: 40)
                    .background(Color.red400)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            .padding(24)
        }
        .onAppear {
            tempRecipeTypes = selectedRecipeTypes
        }
    }
}

#Preview {
    FilterRecipesView(
        selectedRecipeTypes: .constant([]),
        maxDuration: .constant(nil),
        minDifficulty: .constant(nil)
    )
}
