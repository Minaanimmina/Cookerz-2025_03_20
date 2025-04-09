//
//  Picker_Accueil.swift
//  Cookerz
//
//  Created by Carole TREM on 11/03/2025.
//

import SwiftUI

struct Picker_Accueil_View: View {
    
    @Binding var selectedTab: String
    var tabs : [String]
    
    var body: some View {
        
        Picker(selection: $selectedTab, label: Text("")) {
            ForEach(tabs, id: \.self) { tab in
                Text(tab).tag(tab)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding(EdgeInsets(top: 10, leading: 24, bottom: 3, trailing: 24))
    }
}

#Preview {
    Picker_Accueil_View(selectedTab: .constant("Actualités"), tabs: ["Actualités", "Ateliers"])
}
