//
//  RoundBorderedView.swift
//  BuddyUP
//
//  Created by Kimleng Hor on 8/7/23.
//

import SwiftUI

struct RoundBorderedViewModifier: ViewModifier {
    
    let foregroundColor: Color
    let cornerRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .bold()
            .foregroundColor(foregroundColor)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(Color.theme.accent.opacity(0.4), lineWidth: 1.5)
            )
    }
}

extension View {
    func withRoundBordered(foregroundColor: Color = .black, cornerRadius: CGFloat = 10) -> some View {
        modifier(RoundBorderedViewModifier(foregroundColor: foregroundColor, cornerRadius: cornerRadius))
    }
}
