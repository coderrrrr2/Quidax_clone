//
//  app_body.swift
//  Quidax_clone
//
//  Created by Adebayo Philip on 17/02/2025.
//


import SwiftUI

// AppBody view that returns a ZStack with the desired background color
struct AppBody<Content: View>: View {
    var content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            Color(AppColors.backgroundColor)
                .ignoresSafeArea()
            
            content
        }
    }
}
