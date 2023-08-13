//
//  Color.swift
//  BuddyUP
//
//  Created by Kimleng Hor on 8/6/23.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let chatBackground = Color("ChatBackgroundColor")
}
