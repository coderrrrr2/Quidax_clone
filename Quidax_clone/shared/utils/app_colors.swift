
//
//  app_colors.swift
//  Quidax_clone
//
//  Created by Adebayo Philip on 17/02/2025.
//
import SwiftUI

extension Color {
    init(hex: String) {
        // Remove '#' if present
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        if hexSanitized.hasPrefix("#") {
            hexSanitized.removeFirst()
        }
        
        // Ensure it's a valid hex string
        guard hexSanitized.count == 6, let hexValue = Int(hexSanitized, radix: 16) else {
            self.init(white: 0.5) // Default to gray if the hex is invalid
            return
        }
        
        let red = Double((hexValue >> 16) & 0xFF) / 255.0
        let green = Double((hexValue >> 8) & 0xFF) / 255.0
        let blue = Double(hexValue & 0xFF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}

struct AppColors {
    
    
    static let backgroundColor = Color(hex: "#131212")
    
}

