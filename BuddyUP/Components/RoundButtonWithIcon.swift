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
    let backgroundColor: Color?
    let imageColor: Color?
    
    var body: some View {
        ZStack(alignment: .center) {
            Circle()
                .foregroundColor(backgroundColor)
                .frame(width: size, height: size)
                .shadow(color: Color.theme.accent.opacity(0.3), radius: 30)
            Image(systemName: systemName)
                .foregroundColor(imageColor)
                .font(.title3)
                .bold()
        }
        .offset(x: 10, y: 10)
    }
}

struct RoundButtonWithIcon_Previews: PreviewProvider {
    static var previews: some View {
        RoundButtonWithIcon(systemName: "pencil", size: 32, backgroundColor: .white, imageColor: Color.theme.accent)
    ]
}
