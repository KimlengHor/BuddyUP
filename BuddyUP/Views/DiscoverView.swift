//
//  DiscoverView.swift
//  BuddyUP
//
//  Created by Kimleng Hor on 8/12/23.
//

import SwiftUI

struct DiscoverView: View {
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20),
    ]
    
    let names = ["Rachel Greene", "Gunther", "Phoebe Buffay", "Joey Tribbiani", "Chandler", "Richard Burke"]
    let subtitles = ["Shopping buddy", "Heart buddy", "Singing buddy", "Acting buddy", "Sport buddy", "Love buddy"]
    let kms = ["10.5km", "2km", "1.9km", "33km", "71.4km", "0.1km"]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(Range(0...5)) { index in
                    NavigationLink {
                        BuddyDetailView(image: "name\(index + 1)", name: names[index], tag: String(subtitles[index].split(separator: " ").first ?? ""))
                    } label: {
                        BuddyTile(name: names[index], subtitle: subtitles[index], image: "name\(index + 1)", km: kms[index])
                    }
                }
            }
            .padding(24)
        }
        .navigationTitle("Discover")
        .background(Color.theme.background)
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
    
//    let imageUrlString = "https://images.unsplash.com/photo-1591946614720-90a587da4a36?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80"
    
    let name: String
    let subtitle: String
    let image: String
    let km: String
    
    var body: some View {
        VStack(spacing: 25) {
//            AsyncImage(url: URL(string: imageUrlString), content: { content in
//                content.image?
//                    .resizable()
//                    .frame(width: 184, height: 250)
//                    .scaledToFill()
//            })
//            .frame(height: 250)
            
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(height: 150)
            
            VStack(spacing: 5) {
                HStack {
                    VStack(alignment: .leading, spacing: 2) {
                        Text(name)
                            .foregroundColor(.white)
                            .font(.headline)
                        Text(subtitle)
                            .foregroundColor(.white.opacity(0.5))
                            .font(.subheadline)
                            .bold()
                    }
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    Text(km)
                        .foregroundColor(.white.opacity(0.5))
                        .font(.subheadline)
                }
            }
            .padding(10)
            .frame(maxWidth: .infinity)
            .background(Color.black.opacity(0.6))
        }
        .background(Color.white)
        .cornerRadius(10)
//        .frame(height: 226)
    }
}
