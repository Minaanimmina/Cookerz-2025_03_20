//
//  PageTransparentFrontBGImage.swift
//  Cookerz
//
//  Created by apprenant98 on 14/03/2025.
//

import SwiftUI

struct AtelierPageTransparentFrontBGImage: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.clear)
                .frame(width: UIScreen.main.bounds.width, height: 20)
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                }label : {
                    HStack {
                        Text("< Retour")
                    }
                    .padding()
                    .background(Color.white.opacity(0.75))
                    .foregroundColor(.black)
                    .cornerRadius(50)
                }
                Spacer()
                
                
            }
            .padding(.horizontal)
            .padding(.trailing)
            
            Rectangle()
                .fill(Color.clear)
                .frame(width: UIScreen.main.bounds.width, height: 120)
        }
        .padding(.top, 34)
    }
}

#Preview {
    AtelierPageView (atelier : ateliers[0])
}
