//
//  MessagesView.swift
//  BuddyUP
//
//  Created by Kimleng Hor on 8/12/23.
//

import SwiftUI

struct MessagesView: View {
    
    let names = ["Rachel Greene", "Gunther", "Phoebe Buffay", "Joey Tribbiani", "Chandler", "Richard Burke", "Buse", "Kim", "Jenna", "Ching"]
    let messages = [
        "Hello!",
        "How are you?",
        "What's up?",
        "Nice weather today, isn't it?",
        "Did you watch the game last night?",
        "I'm working on a cool project.",
        "Any plans for the weekend?",
        "Have you seen the latest movie?",
        "I love Swift programming!",
        "Let's grab coffee sometime."
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                VStack {
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 15) {
                            ForEach(0..<4, id: \.self) { index in
                                StoryTile(name: names[index], image: "name\(index + 2)")
                            }
                        }
                        .frame(height: 125)
                        .padding([.top, .leading, .bottom], 20)
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.theme.background)
                }
                
                LazyVStack(spacing: 24) {
                    ForEach(0..<6, id: \.self) { index in
                        NavigationLink {
                            MessageView(image: "name\(index + 1)", name: names[index])
                        } label: {
                            MessageTile(name: names[index], image: "name\(index + 1)", message: messages[index])
                        }
                    }
                }
            }
            .padding(.vertical, 24)
        }
        .navigationTitle("Messages")
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MessagesView()
        }
    }
}

struct StoryTile: View {
    
    let brandGradient = Gradient(colors: [Color(.systemTeal), Color(.systemPurple), Color(.systemOrange), Color(.systemTeal)])
    
//    let imageUrlString = "https://images.unsplash.com/photo-1591946614720-90a587da4a36?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80"
    
    let name: String
    let image: String
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
//                AsyncImage(url: URL(string: imageUrlString), content: { content in
//                    content.image?
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: 80, height: 80)
//                        .cornerRadius(10)
//                })
                
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .cornerRadius(10)
                
                Text(String(format: "%.3f", (Double(arc4random_uniform(5001) + 5000) / 1000.0 + 5.0)))
                    .padding(.horizontal, 5)
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.white)
                    .background(.red)
                    .cornerRadius(10)
                    .padding(.bottom, 8)
            }
            .padding(6)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(LinearGradient(gradient: brandGradient,
                                           startPoint: .leading,
                                           endPoint: .trailing),
                            lineWidth: 3.5)
            )
            
            Text(name)
        }
    }
}

struct MessageTile: View {
    
//    let imageUrlString = "https://images.unsplash.com/photo-1591946614720-90a587da4a36?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80"
    let name: String
    let image: String
    let message: String
    
    var body: some View {
        HStack(spacing: 10) {
//            AsyncImage(url: URL(string: imageUrlString), content: { content in
//                content.image?
//                    .resizable()
//                    .scaledToFill()
//                    .frame(width: 65, height: 65)
//                    .cornerRadius(10)
//            })
            
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 65, height: 65)
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(name)
                        .font(.headline)
                        .foregroundColor(.black)
                    Spacer()
                    Text("13:25 PM")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                HStack {
                    Text(message)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                    Spacer(minLength: 50)
                    Text("\(arc4random_uniform(5) + 1)")
                        .frame(width: 25, height: 25)
                        .background(.red)
                        .foregroundColor(.white)
                        .cornerRadius(13)
                        .lineLimit(2)
                }
            }
        }
        .padding(.horizontal, 24)
    }
}
