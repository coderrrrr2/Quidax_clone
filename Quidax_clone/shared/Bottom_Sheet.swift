//
//  Bottom_Sheet.swift
//  Quidax_clone
//
//  Created by Adebayo Philip on 03/03/2025.
//

import SwiftUI

struct BottomSheet<Content: View>: View {
    @Binding var isPresented: Bool
    let detents: [PresentationDetent]
    let backgroundColor: Color // New property for background color
    let content: Content

    init(isPresented: Binding<Bool>,
         detents: [PresentationDetent] = [.medium, .large],
         backgroundColor: Color = AppColors.backgroundColor, // Default background color
         @ViewBuilder content: () -> Content) {
        
        self._isPresented = isPresented
        self.detents = detents
        self.backgroundColor = backgroundColor
        self.content = content()
    }

    var body: some View {
        ZStack(alignment: .topTrailing) { // Align button to the top-right
            backgroundColor
                .edgesIgnoringSafeArea(.all) // Full modal background

            VStack {
                Spacer() // Pushes the close button to the top
                content // Main modal content
                    .padding(.top, 30) // Adjust to prevent overlap
            }
            .padding(.top, 20) // Push content down

            // Floating Close Button (Half Above Modal)
            Button(action: {
                isPresented = false
            }) {
                ZStack {
                    Circle()
                        .fill(AppColors.purple) // Background color for the close button
                        .frame(width: 50, height: 50) // Adjust size
                    
                    Image(systemName: "xmark")
                        .font(.title2)
                        .foregroundColor(.white) // White "X" icon
                }
            }
            .offset(y: 25) // Move half of the button **above the modal**
            .padding(.top, -10) // Adjust positioning
            .padding(.trailing, 20) // Move to the right
        }
        .presentationDetents(Set(detents)) // Supports different sizes
    }
}
