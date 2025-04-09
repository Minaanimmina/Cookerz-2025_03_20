//
//  AtelierPickerDateView.swift
//  Cookerz
//
//  Created by apprenant98 on 17/03/2025.
//


import SwiftUI

struct AtelierPickerDateView: View {
    @Binding var atelierDateChosen: Bool
    @Binding var isPickerPresented: Bool
    @Binding var atelierDate : Date
    var body: some View {
        VStack {
            HStack {
                Text ("Date & horaire")
                    .foregroundStyle(Color.black)
                Spacer()
                Button {
                    atelierDateChosen = true
                    print (atelierDateChosen)
                    isPickerPresented.toggle()
                } label: {
                    Text("Valider")
                        .foregroundStyle(Color.blue)
                }
            }
            .padding()
            .background(Color.grisFond.opacity(0.5))
            .cornerRadius(10)
            
            HStack {
                Spacer()
                DatePicker("", selection: $atelierDate, displayedComponents: [.date, .hourAndMinute])
                    .datePickerStyle(WheelDatePickerStyle())
                    .pickerStyle(.wheel)
            }
        }
        .padding(.horizontal, 25)
        .frame(maxHeight: 250)
        .background(Color.white)
    }
}
