//
//  Wallet_view.swift
//  Quidax_clone
//
//  Created by Adebayo Philip on 26/02/2025.
//

import SwiftUI



struct Wallet_view: View {
    @Binding var text: String



    var body: some View {

        NavigationStack {
            AppBody (
                padding: nil,
                content: {   VStack(alignment:.leading) {
                    
                    VStack {

                        HStack(alignment: .top) {

                            AppText(text:"Wallets",fontWeight: .bold,fontSize: 25).padding(.horizontal,30)
                        }.frame(maxWidth: .infinity,alignment: .leading).background(AppColors.grey)
                        VStack{
                            Ybox(height: 50)
                        }    .frame( maxWidth: .infinity)
    .background(AppColors.grey)
                        HStack {
                            HStack{
                                VStack {
                                    HStack {
                                        VStack(alignment: .leading) {
                                            AppText(text: "TOTAL VALUE")
                                            
                                            
                                            Ybox(height: 20)
                                            HStack(alignment:.top) {
                                                AppText(text: "~0.00", fontWeight:.bold  ,fontSize: 30)
                                                AppText(text: "NGN", fontWeight:.bold  ,fontSize: 10)

                                            }
                                            Ybox(height: 20)

                                            HStack {
                                                Image(systemName: "arrowtriangle.up.fill")
                                                    .font(.system(size: 10))  // Adjust size
                                                    .foregroundColor(.green)
                                                HStack(spacing: 2) {
                                                    AppText(text: "0.00%", fontWeight: .semibold, fontSize: 15, textColor: .green)
                                                    AppText(text: " in the last 24 hours", fontWeight: .semibold, fontSize: 15, textColor: .white)
                                                }

                                            }

                                        }
                                        Spacer()
                                        VStack{
                                            
                                            Container(
                                                
                                                backgroundColor: AppColors.grey2,
                                                
                                                cornerRadius:40,
                                                borderColor: AppColors.grey2,
                                                
                                                borderWidth: 0.5,
                                                width:90,
                                                height: 30,
                                                
                                                content:{
                                                    HStack(spacing:10){
                                                        AppText(text: "Hide" , fontWeight:.bold,fontSize: 17 )
                                                        
                                                        Image(systemName: "eye")
                                                            .font(.system(size: 10))  // Adjust size
                                                            .foregroundColor(.white)
                                                        
                                                    }
                                                }
                                            )
                                            
                                        }
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading).padding(.horizontal,30)
                                    .padding(.bottom,20)
                                }.background(AppColors.grey)
                            }
                        }.padding(.bottom,20)
                    }
                    
                   
                    ScrollView {
                     
                        
                        AppText(text: "Fiat" ,fontWeight:.semibold,fontSize: 20)  .frame(maxWidth: .infinity, alignment: .leading)
                        Ybox(height: 20)
                        Container(
                            
                            borderColor: AppColors.grey2 ,
                            borderWidth: 1,
                            width:360,
                            height: 140,
                            
                            content:{
                                HStack {
                                    VStack(alignment:.leading){
                                        AppText(text: "NGN")

                                        Ybox(height: 10)
                                        AppText(text: "Nigerian Naira")

                                        
                                    }
                                    Spacer()
                                    VStack(alignment:.leading){
                                        AppText(text: "NGN 0.00")
                                        Ybox(height: 10)
                                        AppText(text: "~NGN 0.00")

                                        
                                    }
                                }
                            }
                        )
                        
                        Ybox(height: 30)
                        
                        Container(
                            
                            borderColor: AppColors.grey ,
                            borderWidth: 1,
                            width:360,
                            height: 140,
                            
                            content:{
                                HStack {
                                    VStack(alignment:.leading){
                                        AppText(text: "USD")

                                        Ybox(height: 10)
                                        AppText(text: "US Dollar")

                                        
                                    }
                                    Spacer()
                                    VStack(alignment:.leading){
                                        AppText(text: "NGN 0.00")
                                        Ybox(height: 10)
                                        AppText(text: "~NGN 0.00")

                                        
                                    }
                                }
                            }
                        )
                        Ybox(height: 40)
                 
                        HStack{
                            AppText(text: "Assets",fontSize: 20)
                            Spacer()
                            Image(systemName: "eye")
                                .font(.system(size: 10))  // Adjust size
                                .foregroundColor(AppColors.greyText)
                            AppText(text: "Hide 0 Balance",textColor: AppColors.greyText)

                        }
                        Ybox(height: 30)
                        AppTextField(
                          
                            text: $text,
                                          placeholder: "Search Assets",
                                          fontSize: 18,
                                          height: 60,
                            suffixIcon: Image(systemName: "magnifyingglass"),
                                          suffixAction: {
                                              text = ""
                                          }
                        )

                        Ybox(height: 20)
                        Container(
                            
                            borderColor: AppColors.grey ,
                            borderWidth: 1,
                            width:360,
                            height: 140,
                            
                            content:{
                                HStack {
                                    VStack(alignment:.leading){
                                        AppText(text: "AAVE")

                                        Ybox(height: 10)
                                        AppText(text: "AAVE")

                                        
                                    }
                                    Spacer()
                                    VStack(alignment:.leading){
                                        AppText(text: "AAVE 0.00")
                                        Ybox(height: 10)
                                        AppText(text: "~NGN 0.00")

                                        
                                    }
                                }
                            }
                        )
                      
                        
                        
                    }.padding(.horizontal,30)
                    //                    .padding(.top,-1)
                    
                }
                    
                    
                }
                
            )
        }
        
        
    }
}

#Preview {
    Wallet_view(text: .constant(""))
}
