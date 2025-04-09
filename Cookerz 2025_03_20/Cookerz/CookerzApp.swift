//
//  CookerzApp.swift
//  Cookerz
//
//  Created by apprenant98 on 05/03/2025.
//

import SwiftUI

@main
struct CookerzApp: App {
    @StateObject var baseViewModel = BaseViewModel()
    
    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environmentObject(baseViewModel)
        }
    }
}
