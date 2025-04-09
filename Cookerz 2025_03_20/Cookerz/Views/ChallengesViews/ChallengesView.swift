//
//  ChallengesView.swift
//  Cookerz
//
//  Created by apprenant87 on 10/03/2025.
//

import SwiftUI

struct ChallengesView: View {
    
    @EnvironmentObject var baseViewModel: BaseViewModel
    
    var tabs = ["Défis", "Validés", "Récompenses"]

    @State var challenge : Challenge = challenge0
    
    @State var selectedTab = "Défis"
    
    func test() {
            for challenge in baseViewModel.user.listChallenges {
                print("baseViewModel user.listChallenge \(challenge.name) : \(challenge.challengeStatus)")
            }
            for challenge in baseViewModel.onGoingChallenges {
                print("baseViewModel user.onGoingChallenge \(challenge.name) : \(challenge.challengeStatus)")
            }
        }


    var body: some View {
        NavigationStack {
            VStack {
                // Segmented Picker
                VStack {
                    PickerChallenges (selectedTab: $selectedTab, tabs: tabs)
                    
//                    Button {
//                                            test()
//                    } label: {
//                        Text("TEST")
//                            .padding()
//                            .background(Color.blue)
//                            .foregroundStyle(Color.white)
//                    }
                    
                    if selectedTab == "Défis" {
                        AllChallengesView(randomChallenge : challenge)
                    } else if selectedTab == "Validés" {
                        OngoingChallengesView(challenge: challenge)
                    } else {
                        AllRewardsChallengesView()
                    }
                }
//                .onAppear {
//                    selectedTab = "Défis"
//                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                        Text("Défis")
                            .font(.PoppinsTitle3Medium())
                }
                ToolbarItem(placement: .topBarTrailing) {
                    TotalUserPointsView()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .animation(.easeIn(duration: 0.3), value: selectedTab)
        }
    }
}

#Preview {
    ChallengesView()
        .environmentObject(BaseViewModel())
}


