//
//  app_text.swift
//  Quidax_clone
//
//  Created by Adebayo Philip on 17/02/2025.
//
import SwiftUI

struct AppText: View {
    // Required parameters
    var text: String
    
    // Optional parameters with default values
    var font: Font = .body
    var fontWeight: Font.Weight = .regular
    var fontSize: CGFloat = 16
    var textColor: Color = .primary
    var textAlignment: TextAlignment = .leading
    var lineLimit: Int? = nil
    var padding: EdgeInsets = EdgeInsets()
    var isBold: Bool = false
    var isItalic: Bool = false
    
    init(text: String, font: Font = .body, fontWeight: Font.Weight = .regular, fontSize: CGFloat = 16, textColor: Color = .white, textAlignment: TextAlignment = .leading, lineLimit: Int? = nil, padding: EdgeInsets = EdgeInsets(), isBold: Bool = false, isItalic: Bool = false) {
        self.text = text
        self.font = font
        self.fontWeight = fontWeight
        self.fontSize = fontSize
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.lineLimit = lineLimit
        self.padding = padding
        self.isBold = isBold
        self.isItalic = isItalic
    }
    
    var body: some View {
        Text(text)
            .font(font.weight(isBold ? .bold : fontWeight))
            .font(.system(size: fontSize, weight: fontWeight))
            .foregroundColor(textColor)
            .multilineTextAlignment(textAlignment)
            .lineLimit(lineLimit)
            .padding(padding)
            .italic(isItalic ? true : false)
    }
}

