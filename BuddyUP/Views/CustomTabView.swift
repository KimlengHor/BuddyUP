//
//  CustomTabView.swift
//  BuddyUP
//
//  Created by Kimleng Hor on 9/1/23.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case house
    case heart
    case message
    case magnifyingglass
    case person
}

struct CustomTabView: View {
    
    @State var selectedTab: Tab = .house
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $selectedTab) {
                switch selectedTab {
                case .house:
                    DiscoverView()
                case .heart:
                    Text("")
                case .message:
                    MessagesView()
                case .magnifyingglass:
                    SettingsView()
                case .person:
                    EditProfileView()
                }
            }
            Spacer()
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    Image(systemName: tab.rawValue)
                        .scaleEffect(selectedTab == tab ? 1.50 : 1.25)
                        .foregroundColor(selectedTab == tab ? Color.theme.accent : .black)
                        .font(.system(size: 22))
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.1)) {
                                selectedTab = tab
                            }
                        }
                    Spacer()
                }
            }
            .frame(height: 80)
            
        }
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CustomTabView()
        }
    }
}
