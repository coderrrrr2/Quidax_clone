// SharedViews.swift
import SwiftUI

// YBOX for vertical spacing
struct Ybox: View {
    var height: CGFloat
    
    var body: some View {
        Spacer().frame(height: height)
    }
}

// XBOX for horizontal spacing
struct Xbox: View {
    var width: CGFloat
    
    var body: some View {
        Spacer().frame(width: width)
    }
}
