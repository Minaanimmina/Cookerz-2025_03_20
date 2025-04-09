//
//  SettingsView.swift
//  Cookerz
//
//  Created by Apprenant 78 on 11/03/2025.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("Mon compte")
                    .font(.PoppinsBodyMedium())
                    .padding(.bottom, 15)
                
                Text("Modifier mon compte")
                    .font(.PoppinsSubhead())
                    .padding(.bottom, 4)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 16)
            .padding(.vertical, 16)
            .frame(width: 345)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.grisBordure, lineWidth: 1))
            
            VStack(alignment: .leading) {
                Text("Aide et support")
                    .font(.PoppinsBodyMedium())
                    .padding(.bottom, 15)
                
                Text("Un problème technique ?")
                    .font(.PoppinsSubhead())
                    .padding(.bottom, 4)
                
                Text("Donnez votre avis")
                    .font(.PoppinsSubhead())
                    .padding(.bottom, 4)
                
                Text("Contactez-nous")
                    .font(.PoppinsSubhead())
                    .padding(.bottom, 4)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 16)
            .padding(.vertical, 16)
            .frame(width: 345)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.grisBordure, lineWidth: 1))
            
            VStack(alignment: .leading) {
                Text("Paramètres")
                    .font(.PoppinsBodyMedium())
                    .padding(.bottom, 15)
                
                Text("Langues")
                    .font(.PoppinsSubhead())
                    .padding(.bottom, 4)
                
                Text("Notifications")
                    .font(.PoppinsSubhead())
                    .padding(.bottom, 4)
                
                Text("Confidentialité")
                    .font(.PoppinsSubhead())
                    .padding(.bottom, 4)
                
                Text("Conditions générales d’utilisation")
                    .font(.PoppinsSubhead())
                    .padding(.bottom, 4)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 16)
            .padding(.vertical, 16)
            .frame(width: 345)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.grisBordure, lineWidth: 1))
            
            Text("Se déconnecter")
                .font(.PoppinsCalloutMedium())
                .foregroundStyle(Color.red400)
                .padding(.bottom, 10)
                .padding(.top, 20)
                .padding(.leading, 10)
    
            Text("Supprimer mon compte")
                .font(.PoppinsFootnote())
                .underline()
                .foregroundStyle(Color.black)
                .padding(.leading, 10)
        }
    }
}

#Preview {
    SettingsView()
}




