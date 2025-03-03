//
//  market_view.swift
//  Quidax_clone
//
//  Created by Adebayo Philip on 26/02/2025.
//

import SwiftUI

struct market_view: View {
    @Binding var text: String

    @State private var selectedTab = 0
    let tabs = ["All", "Favourites", "Gainers", "Losers"]

    var body: some View {
        NavigationStack {
            AppBody(
                padding: nil,
                content: {
                    VStack {
                        VStack {
                            AppText(text: "Markets", fontWeight: .bold, fontSize: 25)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                        .background(AppColors.backgroundColor)

                        HStack {
                            VStack(spacing: 10) {
                                ScrollView(.horizontal) {
                                    HStack {
                                        ForEach(0..<tabs.count, id: \.self) { index in
                                            Button(action: {
                                                selectedTab = index
                                            }) {
                                                VStack {
                                                    AppText(
                                                        text: tabs[index],
                                                        fontWeight: .bold,
                                                        fontSize: 18
                                                    )
                                                    .foregroundColor(selectedTab == index ? AppColors.pink : .gray)
                                                    
                                                    // Indicator
                                                    if selectedTab == index {
                                                        Rectangle()
                                                            .frame(height: 3)
                                                            .foregroundColor(AppColors.pink)
                                                            .cornerRadius(2)
                                                    } else {
                                                        Rectangle()
                                                            .frame(height: 3)
                                                            .foregroundColor(.clear) // Invisible when not selected
                                                    }
                                                }.padding(.horizontal,10)
                                            }
                                        }
                                    }
                                    .padding(EdgeInsets(top: 20, leading: 10, bottom: 0, trailing: 20))
                                }
                            }
                            .background(AppColors.backgroundColor)
                       
                            Container(
                                
                                backgroundColor: AppColors.grey2,
                                
                                cornerRadius:40,
                                borderColor: AppColors.grey2,
                                
                                borderWidth: 0.5,
                                width:150,
                                height: 40,
                                
                                content:{
                                    HStack(spacing:10){
                                        AppText(text: "Market Cap" , fontWeight:.bold,fontSize: 17 )
                                        
                                        Image(systemName: "eye")
                                            .font(.system(size: 10))  // Adjust size
                                            .foregroundColor(.white)
                                        
                                    }
                                }
                            ).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20))

                        }
                        VStack{
                            
                        }.background(AppColors.grey2)
                       
                        HStack(spacing: 30) {
                            AppText(text: "ALL", fontWeight: .bold, fontSize: 19)
                            AppText(text: "USDT", fontWeight: .bold, fontSize: 19)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 20)
                        .background(AppColors.grey)

                        ScrollView {
                            TabView(selection: $selectedTab) {
                                AllView(text: $text)  // Pass the text binding
                                AllView(text: $text)
                                AllView(text: $text)
                                AllView(text: $text)
                            }.frame(height: 1000)

                            
                            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))                        }
                    }
                }
            )
        }
    }
}

#Preview {
    market_view(text: .constant(""))
}
struct AllView: View {
    @Binding var text: String  // Add Binding variable
    
    var body: some View {
        VStack {
            Container(
                borderColor: AppColors.grey,
                borderWidth: 1,
                width: 360,
                height: 140,
                content: {
                    HStack {
                        VStack(alignment: .leading) {
                            AppText(text: "USD",textColor: .white)
                            Ybox(height: 10)
                            AppText(text: "US Dollar")
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                            AppText(text: "NGN 0.00")
                            Ybox(height: 10)
                            AppText(text: "~NGN 0.00")
                        }
                    }
                }
            )
            
            AppTextField(
                text: $text, // Use the binding here
                placeholder: "Search Assets",
                fontSize: 18,
                height: 60,
                suffixIcon: Image(systemName: "magnifyingglass"),
                suffixAction: {
                    text = ""
                }
            )
        }
    }
}
