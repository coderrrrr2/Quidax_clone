//
//  home_base.swift
//  Quidax_clone
//
//  Created by Adebayo Philip on 22/02/2025.
//

import SwiftUI

struct HomeBase: View {
    @State private var showTradeSheet = false
    @State private var selectedTab = 0  // Currently selected tab
    @State private var previousTab = 0  // Store the last tab before tapping "Trade"

    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 19/255, green: 18/255, blue: 18/255, alpha: 1.0)
        appearance.shadowColor = .clear

        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }

    var body: some View {
        ZStack {
            AppBody {
                TabView(selection: $selectedTab) {
                    HomeView()
                        .tabItem {
                            Image(systemName: "house.fill")
                            Text("Home")
                        }
                        .tag(0)

                    market_view(text: .constant(""))
                        .tabItem {
                            Image(systemName: "cart.fill")
                            Text("Markets")
                        }
                        .tag(1)

                    Color.clear // Placeholder for "Trade"
                        .tabItem {
                            Image(systemName: "arrow.left.arrow.right")
                            Text("Trade")
                        }
                        .tag(2)

                    Wallet_view(text: .constant(""))
                        .tabItem {
                            Image(systemName: "mappin.circle.fill")
                            Text("Wallets")
                        }
                        .tag(3)

                    More_view(text: .constant(""))
                        .tabItem {
                            Image(systemName: "mappin.circle.fill")
                            Text("More")
                        }
                        .tag(4)
                }
                .onChange(of: selectedTab) {
                    if selectedTab == 2 { // "Trade" tab tapped
                        previousTab = previousTab == 2 ? 0 : previousTab // Avoid self-loop
                        showTradeSheet = true
                        selectedTab = previousTab // Restore previous tab
                    } else {
                        previousTab = selectedTab // Update previous tab
                    }
                }
            }
        }
        .sheet(isPresented: $showTradeSheet) {
            BottomSheet(isPresented: $showTradeSheet) {
                VStack {
                    Text("Trade Modal Sheet")
                        .font(.title)
                        .padding()

                  
                }
            }
        }
    }
}



#Preview {
    HomeBase()
}
