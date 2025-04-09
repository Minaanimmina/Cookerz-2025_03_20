//
//  SwiftUIView.swift
//  Cookerz
//
//  Created by Apprenant 85 on 11/03/2025.
//

import SwiftUI

struct FlameDifficulty: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color("red-50"))
                .frame(width: 40, height: 40)
            
            Image("flame1_bw")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 25)
        }
    }
}


#Preview {
    FlameDifficulty()
}
