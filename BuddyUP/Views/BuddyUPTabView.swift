//
//  BuddyUPTabView.swift
//  BuddyUP
//
//  Created by Kimleng Hor on 9/1/23.
//

import SwiftUI

struct BuddyUPTabView: View {
    
    @State var selectedTab: Tab = .house
    
    var body: some View {
        TabView {
            NavigationView {
                DiscoverView()
            }
            .tabItem {
                Image(systemName: "magnifyingglass")
            }
            
//            Text("")
//                .tabItem {
//                    Image(systemName: "heart")
//                }
            
            NavigationView {
                MessagesView()
            }
            .tabItem {
                Image(systemName: "message")
            }
            
            NavigationView {
                SettingsView()
            }
            .tabItem {
                Image(systemName: "gear")
            }
            
            NavigationView {
                EditProfileView()
            }
            .tabItem {
                Image(systemName: "person")
            }
        }
    }
}

struct BuddyUPTabView_Previews: PreviewProvider {
    static var previews: some View {
        BuddyUPTabView()
    }
}
