//
//  BoardingView.swift
//  BuddyUP
//
//  Created by Kimleng Hor on 8/3/23.
//

import SwiftUI

struct BoardingView: View {
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(named: "AccentColor")
        UIPageControl.appearance().pageIndicatorTintColor = UIColor(named: "AccentColor")?.withAlphaComponent(0.2)
    }
    
    @State private var tabViewSelection = 1
    
    var body: some View {
        VStack {
            tabView
            
            Spacer()
            
            informationSection
            
            buttonsSection
        }
    }
}

struct BoardingView_Previews: PreviewProvider {
    static var previews: some View {
        BoardingView()
    }
}

extension BoardingView {
    private var tabView: some View {
        TabView(selection: $tabViewSelection) {
            ForEach(1..<4, id: \.self) { index in
                Image("boarding\(index)")
                    .tag(index)
            }
        }
        .tabViewStyle(.page)
    }
    
    private var informationSection: some View {
        VStack(spacing: 17) {
            Text("Share your UP")
                .bold()
                .font(.title)
            
            VStack(spacing: 2) {
                HStack(spacing: 5) {
                    Text("Please read our")
                        
                    Button {
                        
                    } label: {
                        Text("privacy policy")
                            .underline()
                    }
                }
                
                HStack(spacing: 5) {
                    Text("and")
                        
                    Button {
                        
                    } label: {
                        Text("policy regarding")
                            .underline()
                    }
                    
                    Text("before registering")
                }
            }
            .font(.callout)
            .foregroundColor(Color.gray)
            
        }
    }
    
    private var buttonsSection: some View {
        VStack(spacing: 15) {
            Button {
                
            } label: {
                Text("Next")
                    .bold()
                    .frame(height: 40)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            
            Button {
                
            } label: {
                Text("Skip")
                    .bold()
                    .frame(height: 40)
                    .frame(maxWidth: .infinity)
            }
        }
        .padding(.horizontal, 24)
        .padding(.top, 50)
    }
}
