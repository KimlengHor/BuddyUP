//
//  DiscoverView.swift
//  BuddyUP
//
//  Created by Kimleng Hor on 8/12/23.
//

import SwiftUI

struct DiscoverView: View {
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 45) {
                ForEach(Range(0...5)) { index in
                    NavigationLink {
                        BuddyDetailView()
                    } label: {
                        BuddyTile()
                    }
                }
            }
            .padding(24)
        }
        .navigationTitle("Discover")
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DiscoverView()
        }
    }
}

struct BuddyTile: View {
    
    let imageUrlString = "https://images.unsplash.com/photo-1591946614720-90a587da4a36?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80"
    
    var body: some View {
        ZStack(alignment: .bottom) {
            AsyncImage(url: URL(string: imageUrlString), content: { content in
                content.image?
                    .resizable()
                    .frame(width: 184, height: 250)
                    .scaledToFill()
            })
            .frame(height: 250)
            
            VStack(spacing: 5) {
                HStack {
                    VStack(spacing: 2) {
                        Text("Kimleng Hor")
                            .foregroundColor(.white)
                            .font(.headline)
                        Text("Coding Buddy")
                            .foregroundColor(.white.opacity(0.5))
                            .font(.subheadline)
                            .bold()
                    }
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    Text("10.5km")
                        .foregroundColor(.white.opacity(0.5))
                        .font(.subheadline)
                }
            }
            .padding(10)
            .frame(maxWidth: .infinity)
            .background(Color.black.opacity(0.6))
        }
        .cornerRadius(10)
        .frame(height: 226)
    }
}
