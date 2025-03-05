//
//  LeaderboardView.swift
//  Quidax_clone
//
//  Created by Adebayo Philip on 05/03/2025.
//

import SwiftUI

struct LeaderboardView: View {
    let title: String
    let targetAmount: Double
    let savedAmount: Double
    let members: [Member]
    
    var body: some View {
        VStack {
            LeaderboardHeaderView(title: title, targetAmount: targetAmount, savedAmount: savedAmount)
            
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(members.indices, id: \.self) { index in
                        MemberRowView(rank: index + 1, member: members[index], targetAmount: targetAmount)
                    }
                }
                .padding()
            }
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .navigationBarBackButtonHidden(true)
    }
}

// Renamed HeaderView to avoid redeclaration conflict
struct LeaderboardHeaderView: View {
    let title: String
    let targetAmount: Double
    let savedAmount: Double
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.largeTitle.bold())
                .foregroundColor(.white)
            
            Text("You've saved")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("$\(savedAmount, specifier: "%.2f")")
                .font(.largeTitle.bold())
                .foregroundColor(.white)
            
            ProgressBar(progress: savedAmount / targetAmount)
        }
        .padding()
    }
}

struct MemberRowView: View {
    let rank: Int
    let member: Member
    let targetAmount: Double
    
    var body: some View {
        HStack {
            Text("\(rank)")
                .font(.headline)
                .foregroundColor(.white)
            
            AsyncImage(url: URL(string: member.imageUrl)) { image in
                image.resizable()
            } placeholder: {
                Circle().fill(Color.gray)
            }
            .frame(width: 40, height: 40)
            .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text(member.name)
                    .font(.headline)
                    .foregroundColor(.white)
                
                Text("$\(member.savedAmount, specifier: "%.2f") saved")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            
            ProgressCircle(percentage: member.savedAmount / targetAmount)
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct ProgressBar: View {
    let progress: Double
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 5)
                    .frame(height: 10)
                    .foregroundColor(.gray.opacity(0.5))
                
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: geometry.size.width * CGFloat(progress), height: 10)
                    .foregroundColor(.orange)
            }
        }
        .frame(height: 10)
    }
}

struct ProgressCircle: View {
    let percentage: Double
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray.opacity(0.5), lineWidth: 5)
            
            Circle()
                .trim(from: 0, to: percentage)
                .stroke(Color.orange, lineWidth: 5)
                .rotationEffect(.degrees(-90))
            
            Text("\(Int(percentage * 100))%")
                .font(.caption)
                .foregroundColor(.white)
        }
        .frame(width: 40, height: 40)
    }
}



// Example usage with mock data
struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView(
            title: "Phone",
            targetAmount: 1000000,
            savedAmount: 3252.81,
            members: [
                Member(name: "Godwin T.", imageUrl: "https://example.com/avatar1.png", savedAmount: 341.03),
                Member(name: "Elizabeth O.", imageUrl: "https://example.com/avatar2.png", savedAmount: 234.40),
                Member(name: "Mohammed D.", imageUrl: "https://example.com/avatar3.png", savedAmount: 166.00)
            ]
        )
    }
}

#Preview {
    LeaderboardView(title: "Phone", targetAmount: 1000000, savedAmount: 3252.81, members: [])
}



