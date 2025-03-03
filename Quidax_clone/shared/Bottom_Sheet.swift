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
    let content: Content

    init(isPresented: Binding<Bool>, detents: [PresentationDetent] = [.medium, .large], @ViewBuilder content: () -> Content) {
        self._isPresented = isPresented
        self.detents = detents
        self.content = content()
    }

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
            
            content
        }
        .presentationDetents(Set(detents)) // Allows customizable sizes
    }
}
