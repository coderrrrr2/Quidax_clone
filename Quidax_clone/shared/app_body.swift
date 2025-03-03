//
//  app_body.swift
//  Quidax_clone
//
//  Created by Adebayo Philip on 17/02/2025.
//
import SwiftUI

struct AppBody<Content: View>: View {
    var content: Content
    var padding: EdgeInsets?  // Allow padding to be optional

    init(padding: EdgeInsets? = nil, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.padding = padding
    }

    var body: some View {
        ZStack {
            Color(AppColors.backgroundColor)
                .ignoresSafeArea()
            
            if let padding = padding {
                content.padding(padding)  // Apply padding if provided
            } else {
                content  // No padding applied
            }
        }
    }
}
