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
    let cornerRadius: CGFloat
    let height: CGFloat
    
    var body: some View {
        TextField(placeholder, text: $text)
            .padding(.horizontal, 20)
            .frame(height: height)
            .withRoundBordered(cornerRadius: cornerRadius)
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(text: .constant(""), placeholder: "Test", cornerRadius: 10, height: 30)
    }
}
