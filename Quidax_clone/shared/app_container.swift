//
//  app_container.swift
//  Quidax_clone
//
//  Created by Adebayo Philip on 17/02/2025.
import SwiftUI
struct Container<Content: View>: View {
    var backgroundColor: Color
    var cornerRadius: CGFloat
    var borderColor: Color
    var borderWidth: CGFloat
    var width: CGFloat?
    var height: CGFloat?
    var padding: EdgeInsets // Inner padding for content
    var content: () -> Content

    init(
        backgroundColor: Color = AppColors.backgroundColor,
        cornerRadius: CGFloat = 10,
        borderColor: Color = AppColors.backgroundColor,
        borderWidth: CGFloat = 4,
        width: CGFloat? = nil,
        height: CGFloat? = nil,
        padding: EdgeInsets = EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10), // Default inner padding
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.width = width
        self.height = height
        self.padding = padding
        self.content = content
    }

    var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .fill(backgroundColor)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(borderColor, lineWidth: borderWidth)
            )
            .frame(width: width, height: height)
            .overlay(
                content()
                    .padding(padding),
                alignment: .topLeading
            )
            .cornerRadius(cornerRadius) // Ensure corner radius is respected
    }
}


extension View {
    func applyPadding(_ insets: EdgeInsets?) -> some View {
        if let insets = insets {
            return AnyView(self.padding(insets))
        } else {
            return AnyView(self)
        }
    }
}
