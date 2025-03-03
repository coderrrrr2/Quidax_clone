import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            AppBody {
                VStack {
                    HeaderView()
                    ScrollView {
                        PortfolioSection()
                        VerificationBanner()
                        CryptoInfoCards()
                        TransactionOptions()
                        MarketSection()
                    }
                }
            }
        }
    }
}

struct HeaderView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "plus")
                    .font(.system(size: 20)) // Increase size
                    .foregroundColor(.blue)
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
        Container(backgroundColor: AppColors.grey2, cornerRadius: 20, width: 110, height: 30) {
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
        Container(backgroundColor: AppColors.pink, width: 360, height: 140) {
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
        HStack {
            AppText(text: "Favourites")
            AppText(text: "Top markets")
        }
        .padding(.top, 30)
    }
}

// MARK: - Preview
#Preview {
    HomeView()
}
