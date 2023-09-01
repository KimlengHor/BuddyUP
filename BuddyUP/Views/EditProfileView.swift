//
//  EditProfileView.swift
//  BuddyUP
//
//  Created by Kimleng Hor on 8/9/23.
//

import SwiftUI

struct EditProfileView: View {
    
    @State private var showProfilePictureView: Bool = false
    
    let imageUrlString = "https://images.unsplash.com/photo-1591946614720-90a587da4a36?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80"
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 50) {
                    
                    ZStack(alignment: .bottomTrailing) {
                        AsyncImage(url: URL(string: imageUrlString), content: { content in
                            content.image?
                                .resizable()
                                .scaledToFill()
                                .frame(width: 160, height: 160)
                                .cornerRadius(10)
                                .shadow(color: Color.theme.accent.opacity(0.3), radius: 50)
                        })
                        
                        RoundButtonWithIcon(systemName: "pencil", size: 32, backgroundColor: .white, imageColor: Color.theme.accent, imageSize: 15) {
                            showProfilePictureView.toggle()
                        }
                        .bold()
                        .offset(x: 10, y: 10)
                    }
                    .padding(.top, 23)
                    
                    
                    profileInfoTile(title: "Username", info: "Monica Geller")
                    profileInfoTile(title: "Email", info: "monica_geller@gmail.com")
                    profileInfoTile(title: "Phone", info: "+095 1232 4545 0206")
                    profileInfoTile(title: "Gender", info: "Female")
                    profileInfoTile(title: "Date of birth", info: "06.12.2011")
                }
                .padding(24)
                .background(Color.theme.background)
                .fullScreenCover(isPresented: $showProfilePictureView) {
                    ProfilePictureView()
                }
            }
        }
        .navigationTitle("Profile")
    }
}

extension EditProfileView {
    private func profileInfoTile(title: String, info: String) -> some View {
        HStack {
            Text(title)
                .foregroundColor(Color.gray)
            Spacer()
            Text(info)
                .bold()
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            EditProfileView()
        }
    }
}


