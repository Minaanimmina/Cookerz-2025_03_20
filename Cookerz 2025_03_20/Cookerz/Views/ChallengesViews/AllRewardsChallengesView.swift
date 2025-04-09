//
//  AllRewardsChallengesView.swift
//  Cookerz
//
//  Created by apprenant87 on 10/03/2025.
//

import SwiftUI

struct AllRewardsChallengesView: View {
    
    // filtre type de récompenses
    var cookBookRewards: [Reward] {
        rewards.filter { $0.type == .cookBook }
    }
    var voucherRewards: [Reward] {
        rewards.filter { $0.type == .voucher }
    }
    
    @State var showAlert: Bool = false
    
    // modale afficher grande carte récompense
    @State private var selectedReward: Reward?
    @State private var showDetailModal = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("L'heure de la carotte !")
                    .font(.PoppinsTitle3Medium())
                    .padding(.top, 10)
                    .padding(.leading, 24)
                
                Text("Tu as aussi le droit de te faire plaisir")
                    .font(.PoppinsFootnote())
                    .padding(.bottom, 10)
                    .padding(.leading, 24)
                
                Text("Coups de coeur")
                    .font(.PoppinsCalloutMedium())
                    .padding(.bottom, 3)
                    .padding(.leading, 24)
                
                // récompenses coup de coeur via tableau en bas du fichier
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        Spacer().frame(width: 24)
                        ForEach(favRewards, id: \.name) { reward in
                            Button(action: {
                                selectedReward = reward
                                showDetailModal = true
                            }) {
                                RewardSmallRectangleCardView(reward: reward)
                            }
                        }
                    }
                }
                
                Text("Bons d'achats")
                    .font(.PoppinsCalloutMedium())
                    .padding(.bottom, 3)
                    .padding(.top, 5)
                    .padding(.leading, 24)
                
                // récompenses .voucher
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        Spacer().frame(width: 24)
                        ForEach(voucherRewards) { reward in
                            Button(action: {
                                selectedReward = reward
                                showDetailModal = true
                            }) {
                                RewardSmallRectangleCardView(reward: reward)
                            }
                        }
                    }
                }
                
                Text("Livres de cuisine")
                    .font(.PoppinsCalloutMedium())
                    .padding(.bottom, 3)
                    .padding(.top, 5)
                    .padding(.leading, 24)
                
                // récompenses .cookbook
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        Spacer().frame(width: 24)
                        ForEach(cookBookRewards) { reward in
                            Button(action: {
                                selectedReward = reward
                                showDetailModal = true
                            }) {
                                RewardSmallRectangleCardView(reward: reward)
                            }
                        }
                    }
                }
            }
        }
        .sheet(item: $selectedReward) { reward in
            RewardBigRectangleCardView(reward: reward, showAlert: $showAlert)
        }
    }
}

#Preview {
    AllRewardsChallengesView()
}

// tableau local pour récompenses coups de coeur
struct FavRewards {
    var name : String
    var icon : String
    var description : String
    var points : Int
}

var favRewards = [
    Reward(name: "Bon de 15€ chez Too Good To Go", type: .voucher, icon: "logo too good to go", description: "Un bon d'achat de 15€ sur votre prochaine commande chez Too Good To Go.", points: 2500 ),
    
    Reward(name: "-20% chez Kusmi Tea", type: .voucher, icon: "logo_kusmi_tea", description: "20% de réduction sur votre prochaine commande de thés et infusions chez Kusmi Tea.", points: 2000),
    
    Reward(name: "Tomate, feta, huile d'olive & citron", type: .cookBook, icon: "tomate_feta_etc", description: "Tomate, coriandre, burrata, aubergine,  huile d’olive, miel, grenade, basilic, agneau… La cuisine de Lou s’imprègne des saveurs du soleil pour livrer plus de 80 recettes de tous les jours, gourmandes, parfumées, healthy et tout en simplicité : de la tatin de légumes d’été, en passant par la salade colorée de quinoa feta-grenade-basilic, le tajine d’agneau aux pruneaux ou encore la brioche perdue à l’huile d’olive…", points: 2000),
    
    Reward(name: "Avant, j'aimais pas les légumes", type: .cookBook, icon: "avant-j-aimais-pas-les-legumes", description: "Ce livre va vous faire changer d'avis sur les légumes ! À travers 65 recettes créatives et faciles, découvrez une cuisine colorée et pleine de saveurs tout en prenant plaisir à cuisiner. Sublimez les légumes et réalisez des plats qui convaincront même les plus sceptiques ! ", points: 2000),
    
    Reward(name: "Bon de 5€ chez Boulanger", type: .voucher, icon: "logo_boulanger", description: "5€ offerts pour tout achat supérieur à 25€ chez Monoprix.", points: 1000),
    
    Reward(name: "Le grand livre de la cuisine asiatique", type: .cookBook, icon: "Le-grand-livre-de-la-cuisine-asiatique", description: "Le livre de référence de la cuisine asiatique ! Chine, Japon, Corée, Laos, Vietnam, Thaïlande, Cambodge, Indonésie, Malaisie, Singapour …. Tous les plats incontournables, plus de 150 recettes d'entrées, soupes, salades, viandes, poissons, riz, légumes, œufs, nouilles et desserts. Sans oublier toutes les bases, les gestes incontournable en pas à pas, des infos sur les ustensiles et les ingrédients indispensables et de nombreuses astuces...", points: 3000)
    
]
