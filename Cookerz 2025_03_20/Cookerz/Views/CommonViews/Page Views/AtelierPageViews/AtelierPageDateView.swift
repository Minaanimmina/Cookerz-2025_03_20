//
//  AtelierPageDateView.swift
//  Cookerz
//
//  Created by apprenant98 on 13/03/2025.
//

import SwiftUI

struct AtelierPageDateView: View {
    var atelier: Atelier
    
    var body: some View {
        VStack {
            Image("calendar")
                .resizable()
                .frame(width: 20, height: 20)
                .padding(2)
            Text(getFormattedDateAndTime())
                .font(.PoppinsSubhead())
        }
        .padding(16)
        .frame(maxWidth: .infinity)
        .background(Color.red50)
        .cornerRadius(16)
    }
    
    func getFormattedDateAndTime() -> String {
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "dd/MM"
        let dateString = dateFormatter.string(from: atelier.date)
        
        let timeFormatter = DateFormatter()

        timeFormatter.dateFormat = "HH:mm"
        let timeString = timeFormatter.string(from: atelier.date)
        

        return "\(dateString) \(timeString)"
    }
}

#Preview {
    AtelierPageView (atelier: ateliers[0])
}
