//
//  CustomTextField.swift
//  BuddyUP
//
//  Created by Kimleng Hor on 8/7/23.
//

import SwiftUI

struct CustomTextField: View {
    
    @Binding var text: String
    let placeholder: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .padding(20)
            .withRoundBordered()
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(text: .constant(""), placeholder: "Test")
    }
}
