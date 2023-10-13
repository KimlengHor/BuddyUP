//
//  SignupView.swift
//  BuddyUP
//
//  Created by Kimleng Hor on 9/1/23.
//

import SwiftUI

struct SignupView: View {
    
    let isLogin: Bool
    
    @State private var emailText: String = ""
    @State private var passwordText: String = ""
    
    var body: some View {
        VStack(spacing: 15) {
            VStack(spacing: 33) {
                
                HStack(spacing: 0) {
                    NavigationLink {
                        UserInformationView()
                    } label: {
                        HStack {
                            Image(systemName: "apple.logo")
                            Text("Apple")
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.black)

                    NavigationLink {
                        UserInformationView()
                    } label: {
                        HStack {
                            Image("google")
                                .resizable()
                                .frame(width: 17, height: 17)
                            Text("Google")
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.red)
                }
                .bold()
                .foregroundColor(.white)
                .frame(height: 60)
                .cornerRadius(10)
                
                emailSection
                passwordSection
            }
            
            Spacer()
            
            continueButton
            
            loginSection
        }
        .navigationTitle(isLogin ? "Login" : "Sign up")
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
            textFieldTitle("Enter your email")
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
            Text(isLogin ? "No account yet?" : "Already have an account?")
            NavigationLink {
                SignupView(isLogin: !isLogin)
            } label: {
                Text(isLogin ? "Sign up" : "Login")
                    .bold()
                    .foregroundColor(.black)
            }
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SignupView(isLogin: false)
        }
    }
}
