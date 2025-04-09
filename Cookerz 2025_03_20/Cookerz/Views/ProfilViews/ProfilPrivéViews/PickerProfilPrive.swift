//
//  PickerProfilPrive.swift
//  Cookerz
//
//  Created by apprenant87 on 17/03/2025.
//

import SwiftUI

struct PickerProfilPrive: View {
    @Binding var selectedTabProfilPrive: String
    var tabs : [String]
    
    var body: some View {
        Picker(selection: $selectedTabProfilPrive, label: Text("")) {
            ForEach(tabs, id: \.self) { tab in
                Text(tab).tag(tab)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}

#Preview {
    PickerProfilPrive(selectedTabProfilPrive: .constant("Mes recettes"), tabs: ["Mes défis", "Mes abos"])
}
