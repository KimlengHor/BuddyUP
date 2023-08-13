//
//  MessageView.swift
//  BuddyUP
//
//  Created by Kimleng Hor on 8/13/23.
//

import SwiftUI

struct MessageView: View {
    
    let imageUrlString = "https://images.unsplash.com/photo-1591946614720-90a587da4a36?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80"
    
    @State private var messageText = ""
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 24) {
                    Text("January, 21")
                        .foregroundColor(.gray)
                        .font(.footnote)
                    
                    HStack(spacing: 12) {
                        AsyncImage(url: URL(string: imageUrlString), content: { content in
                            content.image?
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40)
                                .cornerRadius(10)
                        })
                        
                        
                        ZStack(alignment: .bottomTrailing) {
                            VStack(spacing: 7) {
                                HStack {
                                    Text("Do you want to go John?")
                                    Spacer()
                                }
                                
                                HStack {
                                    Spacer()
                                    Text("2:14 PM")
                                        .font(.footnote)
                                        .foregroundColor(.gray)
                                }
                            }
                            .padding(10)
                            .background(.white)
                            .frame(maxWidth: 226)
                            .cornerRadius(radius: 20, corners: [.topLeft, .topRight, .bottomRight])
                            .shadow(color: .gray.opacity(0.2), radius: 30)
                            
                            RoundButtonWithIcon(systemName: "heart.fill", size: 25, backgroundColor: Color.theme.chatBackground, imageColor: .white, imageSize: 10)
                                .offset(x: -10, y: 15)
                        }
                        
                        
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        
                        ZStack(alignment: .bottomLeading) {
                            VStack(spacing: 7) {
                                HStack {
                                    Text("Sound good! When?")
                                    Spacer()
                                }
                                
                                HStack {
                                    Spacer()
                                    Text("2:14 PM")
                                        .font(.footnote)
                                    
                                    HStack(spacing: 0) {
                                        Image(systemName: "checkmark")
                                            .resizable()
                                            .frame(width: 12, height: 12)
                                        Image(systemName: "checkmark")
                                            .resizable()
                                            .frame(width: 12, height: 12)
                                            .offset(x: -5)
                                    }
                                    .bold()
                                    .foregroundColor(.green)
                                }
                            }
                            .padding(10)
                            .foregroundColor(.white)
                            .background(Color.theme.chatBackground)
                            .frame(maxWidth: 226)
                            .cornerRadius(radius: 20, corners: [.topLeft, .topRight, .bottomLeft])
                            .shadow(color: .gray.opacity(0.2), radius: 30)
                            
                            RoundButtonWithIcon(systemName: "heart.fill", size: 25, backgroundColor: .white, imageColor: Color.theme.chatBackground, imageSize: 10)
                                .offset(x: 10, y: 15)
                        }
                        
                    }
                }
                .padding(.top, 20)
                .padding(.horizontal, 24)
                .frame(maxWidth: .infinity)
            }
            .background(Color.theme.background)
            .padding(.top, 10)
            
            VStack {
                HStack(spacing: 9) {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .withRoundContainer(backgroundColor: Color.theme.accent, radius: 5, width: 25, height: 25)
                    
                    CustomTextField(text: $messageText, placeholder: "Type your message ...", cornerRadius: 20, height: 40)
                    
                    Image(systemName: "mic")
                        .resizable()
                        .frame(width: 20, height: 25)
                        .foregroundColor(Color.theme.accent)
                        .font(.headline)
                }
                .padding(.horizontal, 15)
                .padding(.top, 10)
            }
            .frame(height: 73)
            .frame(maxWidth: .infinity)
        }
        .navigationTitle("Kimleng")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MessageView()
        }
    }
}

struct CornerRadiusShape: Shape {
    var radius = CGFloat.infinity
    var corners = UIRectCorner.allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct CornerRadiusStyle: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner

    func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
}

extension View {
    func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
}
