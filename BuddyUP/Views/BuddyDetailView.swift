//
//  BuddyDetailView.swift
//  BuddyUP
//
//  Created by Kimleng Hor on 8/12/23.
//

import SwiftUI

struct BuddyDetailView: View {
    
    let imageUrlString = "https://images.unsplash.com/photo-1591946614720-90a587da4a36?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80"
    
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                ZStack(alignment: .bottom) {
                    ZStack(alignment: .bottom) {
                        AsyncImage(url: URL(string: imageUrlString), content: { content in
                            content.image?
                                .resizable()
                                .scaledToFill()
                                .frame(height: 450)
                                .cornerRadius(10)
                                .shadow(color: Color.theme.accent.opacity(0.3), radius: 50)
                        })
                        
                        VStack(alignment: .leading) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Rachel Greene")
                                        .font(.title)
                                        .bold()
                                        .foregroundColor(.white)
                                    
                                    Text("shopping")
                                        .padding(10)
                                        .font(.subheadline)
                                        .bold()
                                        .foregroundColor(.black)
                                        .background(.white)
                                        .cornerRadius(20)
                                }
                                
                                Spacer()
                            }
                            
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 15)
                        .padding(.bottom, 50)
                        .padding(.top, 20)
                        .background(.black.opacity(0.3))
                        
                    }
                    .cornerRadius(15)
                    
                    HStack(spacing: 20) {
                        RoundButtonWithIcon(systemName: "message", size: 53, backgroundColor: .green, imageColor: .white, imageSize: 20) {
                            
                        }
                        RoundButtonWithIcon(systemName: "bell", size: 63, backgroundColor: .white, imageColor: Color.theme.accent, imageSize: 40) {
                            
                        }
                        RoundButtonWithIcon(systemName: "xmark", size: 53, backgroundColor: .red, imageColor: .white, imageSize: 15) {
                            
                        }
                    }
                    .offset(y: 30)
                }
               
                Text("I am executive at Ralph Lauren in NYC. Wanna talk about fashion, shopping, soap operas and dating? Text me!")
            }
            .padding(24)
        }
        .background(Color.theme.background)
    }
}

struct BuddyDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BuddyDetailView()
    }
}
