//
//  RoundContainerViewModifier.swift
//  BuddyUP
//
//  Created by Kimleng Hor on 8/13/23.
//

import SwiftUI

struct RoundContainerViewModifier: ViewModifier {
    
    let backgroundColor: Color
    let radius: CGFloat
    let shadow: CGFloat?
    let shadowColor: Color?
    let width: CGFloat
    let height: CGFloat
    
    func body(content: Content) -> some View {
        
        ZStack(alignment: .center) {
            RoundedRectangle(cornerRadius: radius)
                .foregroundColor(backgroundColor)
                .frame(width: width, height: height)
                .shadow(color: shadowColor ?? .white, radius: shadow ?? 0)
            content
        }
    }
}

extension View {
    func withRoundContainer(backgroundColor: Color = .white, radius: CGFloat, shadow: CGFloat? = nil, shadowColor: Color? = nil, width: CGFloat, height: CGFloat) -> some View {
        modifier(RoundContainerViewModifier(backgroundColor: backgroundColor, radius: radius, shadow: shadow, shadowColor: shadowColor, width: width, height: height))
    }
}

