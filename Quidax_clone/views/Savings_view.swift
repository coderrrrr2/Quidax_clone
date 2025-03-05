//
//  Savings_view.swift
//  Quidax_clone
//
//  Created by Adebayo Philip on 05/03/2025.
//

import SwiftUI

struct Savings_view: View {
    let items: [(amount: String, participants: String, category: String, endDate: String, bgColor: Color)] = [
        ("$200,000", "1984 Participants", "Phone", "Mar 11, 2025", Color.black.opacity(0.8)),
        ("$150,000", "1620 Participants", "Laptop", "Apr 5, 2025", Color.gray.opacity(0.9)),
        ("$250,000", "2340 Participants", "Tablet", "Feb 28, 2025", Color.blue.opacity(0.8)),
        ("$180,000", "1875 Participants", "Headphones", "May 2, 2025", Color.purple.opacity(0.8)),
        ("$300,000", "2599 Participants", "Smartwatch", "Jun 15, 2025", Color.green.opacity(0.8))
    ]

    var body: some View {
        NavigationStack {
            AppBody(padding: EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20)) {
                VStack(alignment: .leading) {
                    sectionHeader(title: "Top Collections")
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(0..<5, id: \.self) { _ in
                                savingsCard()
                            }
                        }
                        .padding(.horizontal)
                    }

                    Ybox(height: 100)

                    sectionHeader(title: "Upcoming Savings Goals")
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(items, id: \.category) { item in
                                savingsGoalCard(item: item)
                            }
                        }
                        .padding(.horizontal)
                    }
                    Ybox(height: 100)

                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }

    /// Creates a section header with a title.
    private func sectionHeader(title: String) -> some View {
        HStack {
            AppText(text: title, fontWeight: .bold)
            Spacer()
            AppText(text: "See all")
        }
        .padding(.bottom, 10)
    }

    /// Builds a savings card.
    private func savingsCard() -> some View {
        Container(
            backgroundColor: .black,
            cornerRadius: 25,
            borderColor: .black,
            borderWidth: 0.5,
            width: 300,
            height: 170,
            padding: EdgeInsets(top: 20, leading: 10, bottom: 20, trailing: 10)
        ) {
            VStack(alignment: .leading) {
                AppText(text: "Ice Moose Stock/Crypto selection")
                Ybox(height: 10)
                AppText(text: "Ice Moose Stock/Crypto selection", fontWeight: .bold)
                Ybox(height: 10)
                AppText(text: "I have been doing a lot of research")
                Ybox(height: 30)
                HStack {
                    AppText(text: "Feb 18 2023", fontWeight: .bold)
                    Spacer()
                    AppText(text: "1697")
                }
            }
        }
        .padding(.horizontal, 10)
    }

    /// Builds a savings goal card.
    private func savingsGoalCard(item: (amount: String, participants: String, category: String, endDate: String, bgColor: Color)) -> some View {
        NavigationLink(
            destination: LeaderboardView(
                title: item.category,
                targetAmount: Double(item.amount) ?? 200.0,
                savedAmount: (Double(item.amount) ?? 100000.0) / 40, // Ensure safe conversion
                members: generateMembers(for: Double(item.amount.replacingOccurrences(of: ",", with: "")) ?? 1000.0)
            )
        ) {
            VStack(alignment: .leading) {
                Container(
                    backgroundColor: item.bgColor,
                    cornerRadius: 20,
                    borderColor: item.bgColor,
                    borderWidth: 0.5,
                    width: 250,
                    height: 170,
                    padding: EdgeInsets(top: 0, leading: 20, bottom: 40, trailing: 20)
                ) {
                    VStack(alignment: .leading) {
                        Ybox(height: 30)
                        HStack {
                            Container(
                                backgroundColor: .black,
                                cornerRadius: 100,
                                borderColor: .black,
                                borderWidth: 0,
                                width: 40,
                                height: 40
                            ) {
                                AppText(text: "AE", fontWeight: .bold, fontSize: 12, textColor: .white)
                            }
                            Container(
                                backgroundColor: item.bgColor,
                                cornerRadius: 100,
                                borderColor: item.bgColor,
                                borderWidth: 0,
                                width: 60,
                                height: 60
                            ) {
                                HStack(alignment: .center) {
                                    AppText(text: "\(item.amount)", fontWeight: .bold, fontSize: 10)
                                }
                            }
                        }
                        Ybox(height: 10)
                        AppText(text: item.participants, fontWeight: .bold)
                        Ybox(height: 10)
                        HStack {
                            Image(systemName: "dumbbell.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.white)
                            AppText(text: item.amount, fontWeight: .bold)
                        }
                        Ybox(height: 30)
                    }
                }
                Ybox(height: 30)
                AppText(text: item.category, fontWeight: .bold)
                Ybox(height: 10)
                AppText(text: "Ends \(item.endDate)", fontWeight: .light)
                Ybox(height: 10)
            }
        }
        .buttonStyle(PlainButtonStyle()) // Prevents unwanted button styling
    }
  

    func generateMembers(for amount: Double) -> [Member] {
        let percentages: [Double] = [3.6, 2.0, 1.5] + Array(repeating: 1.0, count: 10) + [0.8, 0.75, 0.6, 0.5, 0.4, 0.3, 0.01]
        
        let names: [String] = [
            "Alice", "Bob", "Charlie", "David", "Eve", "Frank", "Grace", "Hank", "Ivy", "Jack",
            "Karen", "Leo", "Mona", "Nathan", "Olivia", "Paul", "Quincy", "Rachel", "Steve", "Tina"
        ]
        
        var members: [Member] = []
        
        for (index, percentage) in percentages.enumerated() {
            let member = Member(
                name: "\(names[index])",
                imageUrl: "https://example.com/avatar\(index + 1).png",
                savedAmount: amount * percentage
            )
            members.append(member)
        }
        
        return members
    }

   


}

#Preview {
    Savings_view()
}

