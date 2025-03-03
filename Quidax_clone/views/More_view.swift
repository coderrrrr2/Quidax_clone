//
//  More_view.swift
//  Quidax_clone
//
//  Created by Adebayo Philip on 26/02/2025.
//

import SwiftUI

struct More_view: View {
    @Binding var text: String

    var body: some View {
        NavigationStack{
            AppBody(
                padding: EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20),

                content:{
                  
                    VStack(alignment:.leading) {
                        AppText(text:"Profile",fontWeight: .bold,fontSize: 25)
                        Ybox(height: 30)

                        HStack{
                            VStack(alignment:.leading) {
                                AppText(text:"Qunoks",fontWeight: .bold,fontSize: 25)
                                AppText(text:"davidunoks@gmail.com",fontWeight: .semibold,fontSize: 15)

                            }

                        }
                        Ybox(height: 30)

                        AppTextField(
                          
                            text: $text,
                                          placeholder: "Search...",
                                          fontSize: 18,
                                          height: 60,
                            suffixIcon: Image(systemName: "magnifyingglass"),
                                          suffixAction: {
                                              text = ""
                                          }
                        )
                        Ybox(height: 30)
                        ScrollView{
                            VStack(alignment:.leading){
                                AppText(text:"Products & Services",fontWeight: .bold,fontSize: 17)
                                Ybox(height: 20)

                                HStack(spacing:25) {
                                    ExtractedView(text: "Savings")
                                    ExtractedView(text: "Price alerts")
                                    ExtractedView(text: "Referral")
                                    ExtractedView(text: "Learn")



                                }.padding(.horizontal,10)
                                Ybox(height: 20)

                                HStack(spacing:25) {
                                    ExtractedView(text: "Suggest")
                                    ExtractedView(text: "Cards")

                                }.padding(.horizontal,10)
                                Ybox(height: 30)

                                AppText(text:"Account & Settings",fontWeight: .bold,fontSize: 17)
                                Ybox(height: 20)

                                HStack(spacing:25) {
                                    ExtractedView(text: "Settings")
                                    ExtractedView(text: "KYC")
                                    ExtractedView(text: "Support")
                                    ExtractedView(text: "Legal")



                                }.padding(.horizontal,10)
                                Ybox(height: 20)

                                HStack(spacing:25) {
                                    ExtractedView(text: "Next of Kin")
                                    ExtractedView(text: "Rate us").padding(.horizontal,10)




                                }
                            }
                           
                        }
                      
                        

                    } .frame(maxWidth: .infinity,alignment: .leading)
                   
                }
                )
            }
        }
    }


#Preview {
    More_view(text: .constant(""))
}

struct ExtractedView: View {
    var text:String

    var body: some View {
        VStack(alignment:.center){
            Container(
                backgroundColor:AppColors.grey,
                borderColor: AppColors.backgroundColor ,
                
                borderWidth: 1,
                width:60,
                height: 60,
                
                content:{
                    
                }
            )
            Ybox(height: 10)
            
            AppText(text:text,fontWeight: .bold,fontSize: 15)
            
        }
    }
}
