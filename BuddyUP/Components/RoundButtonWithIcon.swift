//
//  RoundButtonWithIcon.swift
//  BuddyUP
//
//  Created by Kimleng Hor on 8/10/23.
//

import SwiftUI

struct RoundButtonWithIcon: View {
    
    let systemName: String
    
    var body: some View {
        ZStack(alignment: .center) {
            Circle()
                .foregroundColor(.white)
                .frame(width: 37, height: 37)
                .shadow(color: Color.theme.accent.opacity(0.3), radius: 30)
            Image(systemName: systemName)
                .foregroundColor(Color.theme.accent)
                .font(.title3)
                .bold()
        }
        .offset(x: 10, y: 10)
    }
}

struct RoundButtonWithIcon_Previews: PreviewProvider {
    static var previews: some View {
        RoundButtonWithIcon(systemName: "pencil")
    }
}
