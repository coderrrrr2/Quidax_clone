import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            AppBody {
                VStack(alignment:.leading) {
                    HeaderView()
                    ScrollView {
                        PortfolioSection()
                        VerificationBanner()
                        CryptoInfoCards()
                        TransactionOptions()
                        MarketSection()
                    }
                }.frame(width: .infinity,alignment: .leading)
            }
        }
    }
}

struct HeaderView: View {
    var body: some View {
        VStack {
            HStack {
                Image("Image")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 30, height: 30)
                    .clipped() // Ensures it doesn't overflow the frame

                Xbox(width: 20)
                VStack(alignment: .leading) {
                    AppText(text: "Hello Unoks")
                    Ybox(height: 5)
                    AppText(text: "Purple Tier", fontWeight: .bold, fontSize: 20)
                }
                Spacer()
                Image(systemName: "bell")                    .font(.system(size: 20))                    .foregroundColor(.white)  // Change color to blue

            }
            .padding(.horizontal,20)
            .background(AppColors.grey)
            VStack{
                
            }   .background(AppColors.grey)
        }
    }
}


struct PortfolioSection: View {
    var body: some View {
        VStack {
            Ybox(height: 40)
            HStack {
                VStack(alignment: .leading) {
                    AppText(text: "PORTFOLIO BALANCE")
                    Ybox(height: 20)
                    AppText(text: "0.00", fontWeight: .bold, fontSize: 40)
                }
                Spacer()
                AddFundsButton()
            }
            .padding(.horizontal, 20)
            Ybox(height: 30)
        }
        .background(AppColors.grey)
    }
}


// MARK: - Add Funds Button
struct AddFundsButton: View {
    var body: some View {
        Container( backgroundColor: AppColors.grey2,  cornerRadius: 20, borderColor:AppColors.grey2, width: 110, height: 30) {
            HStack {
                AppText(text: "Add Funds", fontWeight: .bold, fontSize: 12)
                Image(systemName: "plus").font(.system(size: 10)).foregroundColor(.green)
            }
        }
    }
}

// MARK: - Verification Banner
struct VerificationBanner: View {
    var body: some View {
        Container(backgroundColor: AppColors.pink, borderColor:AppColors.purple,borderWidth: 2,  width: 360, height: 140) {
            VStack(alignment: .leading) {
                AppText(text: "Let's get started 🔥", fontWeight: .bold, textColor: .black)
                Ybox(height: 10)
                AppText(text: "Complete your Identity verification, so you can make your first deposit.", textColor: .black)
            }
        }
        .padding(.top, 30)
    }
}


struct CryptoInfoCards: View {
    var body: some View {
        VStack(spacing: 20) {
            Container(backgroundColor: AppColors.backgroundColor, width: 360, height: 100) {
                VStack(alignment: .leading) {
                    AppText(text: "How can I buy my first crypto?")
                    AppText(text: "Watch this 10-second demo to learn how to buy crypto like a pro.", fontSize: 15)
                }
            }
            Container(backgroundColor: AppColors.backgroundColor, width: 360, height: 100) {
                VStack(alignment: .leading) {
                    AppText(text: "What is Bitcoin?")
                    AppText(text: "Understand the fundamentals of Bitcoin and how to trade it.", fontSize: 15)
                }
            }
        }
        .padding(.top, 30)
    }
}

// MARK: - Transaction Options
struct TransactionOptions: View {
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                TransactionOption(title: "Deposit Naira")
                TransactionOption(title: "Swap")
            }
            HStack {
                TransactionOption(title: "Deposit Crypto")
                TransactionOption(title: "Save and Earn")
            }
        }
        .padding(.top, 30)
    }
}

struct TransactionOption: View {
    let title: String
    var body: some View {
        Container(backgroundColor: AppColors.grey, width: 180, height: 170) {
            AppText(text: title)
        }
    }
}

// MARK: - Market Section
struct MarketSection: View {
    var body: some View {
        VStack(alignment:.leading) {
            HStack {
                AppText(text: "Favourites",fontWeight:.semibold)
                AppText(text: "Top markets",fontWeight:.semibold)
            }.padding(.top, 30)
            HStack{
                checkedSection(text:"BTC/USDT",isChecked: false)
                checkedSection(text:"DOGE/USDT",isChecked: false)

            }
            HStack{
                checkedSection(text:"BNB/USDT",isChecked: false)
                checkedSection(text:"POL/USDT",isChecked: false)

            }
            HStack{
                checkedSection(text:"USDC/USDT",isChecked: false)
                checkedSection(text:"AAVE/USDT",isChecked: false)

            }
            
        }
        Ybox(height: 30)
        Container(backgroundColor: AppColors.backgroundColor, cornerRadius: 15, borderColor:AppColors.grey2,borderWidth: 1,width: 376,height: 60) {
            AppText(text:"Add to Favourites",textColor: AppColors.grey3)
        }
        Ybox(height: 30)
        Container(backgroundColor: AppColors.grey, cornerRadius: 15, borderColor:AppColors.grey,borderWidth: 1,width: 376,height: 80) {
            HStack{
                AppText(text:"Need help?",textColor: AppColors.grey3)
                AppText(text:"Chat with support" ,fontWeight:.bold, textColor: AppColors.purple2)

            }
        }
    }
}

struct checkedSection:View{
    let text:String
    let isChecked:Bool

    var body:some View{
        HStack{
            AppText(text: text,fontWeight:.semibold)


        }
    }
}

// MARK: - Preview
#Preview {
    HomeView()
}
