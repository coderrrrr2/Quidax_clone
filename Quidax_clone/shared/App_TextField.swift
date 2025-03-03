//
//  App_TextField.swift
//  Quidax_clone
//
//  Created by Adebayo Philip on 28/02/2025.
//

import SwiftUI

struct AppTextField: View {
    @Binding var text: String
    var placeholder: String
    var placeholderColor: Color = AppColors.grey3
    var textColor: Color = .white
    var fontSize: CGFloat = 16
    var borderColor: Color =  AppColors.grey
    var borderWidth: CGFloat = 1
    var cornerRadius: CGFloat = 10
    var backgroundColor: Color = AppColors.grey
    var height: CGFloat = 50
    var prefixIcon: Image? = nil
    var suffixIcon: Image? = nil
    var suffixAction: (() -> Void)? = nil

    var body: some View {
        HStack {
            if let prefix = prefixIcon {
                prefix
                    .foregroundColor(.gray)
                    .padding(.leading, 10)
            }

            TextField(placeholder, text: $text)
                .foregroundColor(textColor)
                .font(.system(size: fontSize))
                .padding(.vertical, 10)
                .padding(.horizontal, prefixIcon == nil ? 10 : 5) // Adjust padding if prefix exists

            // Suffix Icon inside the TextField
            if let suffix = suffixIcon {
                Button(action: {
                    suffixAction?() // Call the function when clicked
                }) {
                    suffix
                        .foregroundColor(.gray)
                        .padding(.trailing, 20)
                }
            }
        }
        .frame(height: height)
        .background(backgroundColor)
        .cornerRadius(cornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(borderColor, lineWidth: borderWidth)
        )
    }
}
