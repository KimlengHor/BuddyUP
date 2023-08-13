//
//  DefaultButtonViewModifier.swift
//  BuddyUP
//
//  Created by Kimleng Hor on 8/7/23.
//

import Foundation
import SwiftUI


struct DefaultButtonViewModifier: ViewModifier {
    
    let backgroundColor: Color
    let foregroundColor: Color
    let height: CGFloat
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(foregroundColor)
            .frame(height: height)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(10)
            .bold()
    }
}

extension View {
    func withDefaultButtonFormatting(
        backgroundColor: Color = Color.theme.accent,
        foregroundColor: Color = Color.white,
        height: CGFloat = 60) -> some View {
            
        modifier(DefaultButtonViewModifier(backgroundColor: backgroundColor, foregroundColor: foregroundColor, height: height))
    }
}
