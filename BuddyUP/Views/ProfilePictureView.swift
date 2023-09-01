//
//  ProfilePictureView.swift
//  BuddyUP
//
//  Created by Kimleng Hor on 8/10/23.
//

import SwiftUI

struct ProfilePictureView: View {
    
    let imageUrlString = "https://images.unsplash.com/photo-1591946614720-90a587da4a36?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80"
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                ZStack(alignment: .bottomTrailing) {
                    AsyncImage(url: URL(string: imageUrlString), content: { content in
                        content.image?
                            .resizable()
                            .scaledToFill()
                            .frame(width: 160, height: 160)
                            .cornerRadius(10)
                            .shadow(color: Color.theme.accent.opacity(0.3), radius: 50)
                    })
                    
                    RoundButtonWithIcon(systemName: "pencil", size: 32, backgroundColor: .white, imageColor: Color.theme.accent, imageSize: 15)
                    {
                        
                    }
                    .bold()
                    .offset(x: 10, y: 10)
                }
                .padding(.top, 28)
                
                VStack(alignment: .leading, spacing: 30) {
                    Text("Choose your personal sticker")
                        .font(.title2)
                        .bold()
                        .frame(maxWidth: 180)
                    
                    LazyVGrid(columns: columns, spacing: 15) {
                        ForEach(Range(0...8)) { index in
                            AsyncImage(url: URL(string: imageUrlString), content: { content in
                                content.image?
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(10)
                                    .shadow(color: Color.theme.accent.opacity(0.2), radius: 10)
                            })
                        }
                    }
                }
                .padding(24)
            }
        }
        .navigationTitle("Profile Picture")
    }
}

struct ProfilePictureView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProfilePictureView()
        }
    }
}
