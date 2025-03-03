//
//  home_base.swift
//  Quidax_clone
//
//  Created by Adebayo Philip on 22/02/2025.
//

import SwiftUI

struct home_base: View {
    @State private var selectedTab = 0
    @State private var showTradeSheet = false

    init() {
        // Set tab bar background color & appearance
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 19/255, green: 18/255, blue: 18/255, alpha: 1.0)
        appearance.shadowColor = .clear

        // Apply the appearance to all tab bars
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            AppBody {
                TabView(selection: $selectedTab) {
                    HomeView()
                        .tabItem {
                            Image(systemName: "house.fill")
                            Text("Home")
                        }
                        .tag(0)

                    market_view(text:.constant(""))
                        .tabItem {
                            Image(systemName: "cart.fill")
                            Text("Markets")
                        }
                        .tag(1)

                    Color.clear
                        .tabItem {
                            Image(systemName: "arrow.left.arrow.right")
                            Text("Trade")
                        }
                        .tag(2)
                        .onAppear {
                            showTradeSheet = true
                        }

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
            }
        }
        .sheet(isPresented: $showTradeSheet) {
            TradeSheetView(isPresented: $showTradeSheet)
        }
    }
}

// MARK: - Trade Modal Sheet
struct TradeSheetView: View {
    @Binding var isPresented: Bool

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    isPresented = false
                }) {
                    Image(systemName: "xmark")
                        .font(.title2)
                        .padding()
                }
            }
            .padding(.horizontal)
            
            Text("Trade Modal Sheet")
                .font(.title)
                .padding()
            
            Button("Close") {
                isPresented = false
            }
            .padding()
        }
        .presentationDetents([.medium, .large])
    }
}

#Preview {
    home_base()
}
