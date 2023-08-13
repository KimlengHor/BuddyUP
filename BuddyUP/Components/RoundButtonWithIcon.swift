//
//  RoundButtonWithIcon.swift
//  BuddyUP
//
//  Created by Kimleng Hor on 8/10/23.
//

import SwiftUI

struct RoundButtonWithIcon: View {
    
    let systemName: String
    let size: CGFloat
    let backgroundColor: Color
    let imageColor: Color
    let imageSize: CGFloat
    
    var body: some View {
        
        Image(systemName: systemName)
            .resizable()
            .frame(width: imageSize, height: imageSize)
            .foregroundColor(imageColor)
            .withRoundContainer(
                backgroundColor: backgroundColor,
                radius: size / 2,
                shadow: 30,
                shadowColor: Color.theme.accent.opacity(0.3),
                width: size,
                height: size
            )
        
        
    }
}

struct RoundButtonWithIcon_Previews: PreviewProvider {
    static var previews: some View {
        RoundButtonWithIcon(systemName: "pencil", size: 32, backgroundColor: .white, imageColor: Color.theme.accent, imageSize: 25)
    }
}
