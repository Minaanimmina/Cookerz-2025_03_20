//
//  PickerChallenges.swift
//  Cookerz
//
//  Created by apprenant87 on 14/03/2025.
//

import SwiftUI

struct PickerChallenges: View {
    @Binding var selectedTab: String
    var tabs : [String]
    
    init(selectedTab: Binding<String>, tabs: [String]) {
        self._selectedTab = selectedTab
        self.tabs = tabs
        
        // Personnalisation du Segmented Picker
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.white
        UISegmentedControl.appearance().backgroundColor = UIColor(named: "grisFond")
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Poppins-Medium", size: 13) ?? UIFont.systemFont(ofSize: 13),
            .foregroundColor: UIColor.black
        ]
        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .selected)
        
        let attributesNormal: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Poppins-Light", size: 13) ?? UIFont.systemFont(ofSize: 13),
            .foregroundColor: UIColor.black.withAlphaComponent(0.6)
        ]
        UISegmentedControl.appearance().setTitleTextAttributes(attributesNormal, for: .normal)
        
        UISegmentedControl.appearance().setContentPositionAdjustment(
            .zero, forSegmentType: .any, barMetrics: .default
        )
    }
    
    var body: some View {
        
        Picker(selection: $selectedTab, label: Text("")) {
            ForEach(tabs, id: \.self) { tab in
                Text(tab).tag(tab)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding(EdgeInsets(top: 10, leading: 20, bottom: 3, trailing: 20))
    }
}

#Preview {
    PickerChallenges(selectedTab: .constant("Défis"), tabs: ["En cours", "Récompenses"])
}
