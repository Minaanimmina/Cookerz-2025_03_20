//
//  PickerModzlView.swift
//  Cookerz
//
//  Created by apprenant98 on 11/03/2025.
//

import SwiftUI

struct PickerTimeView: View {
    @Binding var TimeHours: Int
    @Binding var TimeMinutes: Int
    @Binding var isPickerPresented : Bool
    var body: some View {
        VStack {
            HStack {
                Text ("Temps total")
                    .foregroundStyle(Color.black)
                Spacer()
                Button {
                    isPickerPresented.toggle()
                }label:{
                    Text("Valider")
                        .foregroundStyle(Color.blue)
                }
            }
            .padding()
            .background(Color.grisFond.opacity(0.5))
            .cornerRadius(10)
            HStack {
                Spacer()
                Picker("Heures", selection: $TimeHours) {
                    ForEach(0...168, id: \.self) { hour in
                        Text("\(hour)")
                    }
                }
                .pickerStyle(.wheel)
                
                
                Text("h")
                
                Picker("Minutes", selection: $TimeMinutes) {
                    ForEach(0...59, id: \.self) { minute in
                        Text("\(minute)")
                    }
                }
                .pickerStyle(.wheel)
                Text("mn")
                Spacer()
                
            }
            
            
        }
        .padding(.horizontal, 25)
        .frame(maxHeight: 250)
        .background(Color.white)
    }
}

#Preview {
    RecipeCreationView()
}
