//
//  SignupView.swift
//  BuddyUP
//
//  Created by Kimleng Hor on 9/1/23.
//

import SwiftUI

struct SignupView: View {
    
    @State private var emailText: String = ""
    @State private var passwordText: String = ""
    
    var body: some View {
        VStack(spacing: 15) {
            VStack(spacing: 33) {
                emailSection
                passwordSection
            }
            
            Spacer()
            
            continueButton
            
            loginSection
        }
        .navigationTitle("Sign up")
        .padding(24)
    }
}

extension SignupView {
    
    private func textFieldTitle(_ title: String) -> some View {
        Text(title)
            .font(.callout)
            .foregroundColor(.gray)
    }
    
    private var emailSection: some View {
        VStack(alignment: .leading, spacing: 15) {
            textFieldTitle("Enter your name")
            CustomTextField(text: $emailText, placeholder:  "Enter your email here", cornerRadius: 10, height: 60)
        }
    }
    
    private var passwordSection: some View {
        VStack(alignment: .leading, spacing: 15) {
            textFieldTitle("Enter your password")
            CustomTextField(text: $passwordText, placeholder:  "Enter your password here", cornerRadius: 10, height: 60)
        }
    }
    
    private var continueButton: some View {
        NavigationLink {
            UserInformationView()
        } label: {
            Text("Continue")
                .withDefaultButtonFormatting(
                    backgroundColor: Color.theme.accent.opacity(0.15),
                    foregroundColor: Color.theme.accent)
        }
    }
    
    private var loginSection: some View {
        HStack {
            Text("Already have an account?")
            Button {
                
            } label: {
                Text("Login")
                    .bold()
                    .foregroundColor(.black)
            }
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SignupView()
        }
    }
}
