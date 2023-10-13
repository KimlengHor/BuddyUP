//
//  BoardingView.swift
//  BuddyUP
//
//  Created by Kimleng Hor on 8/3/23.
//

import SwiftUI

class BoardingViewModel: ObservableObject {
    @Published var titleText: String
    @Published var subTitleText: String
    
    private var titles = ["Share your UP", "Find your buddy", "Meet with your new friend"]
    private var subtitles = ["Explore activities around you according to your interests", "Plan your next activity with your new buddy", "Get to know each other and chat with your buddy"]
    
    init() {
        self.titleText = titles[0]
        self.subTitleText = subtitles[0]
    }
    
    func changeTitleText(tabViewSelection: Int) {
        titleText = titles[tabViewSelection]
        subTitleText = subtitles[tabViewSelection]
    }
}

struct BoardingView: View {
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(named: "AccentColor")
        UIPageControl.appearance().pageIndicatorTintColor = UIColor(named: "AccentColor")?.withAlphaComponent(0.2)
    }
    
    @StateObject private var boardingVM = BoardingViewModel()
    
    @State private var tabViewSelection = 0
    
    var body: some View {
        VStack {
            tabView
            
            Spacer()
            
            informationSection
            
            buttonsSection
        }
        .onChange(of: tabViewSelection) { newValue in
            boardingVM.changeTitleText(tabViewSelection: newValue)
        }
    }
}

struct BoardingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            BoardingView()
        }
    }
}

extension BoardingView {
    private var tabView: some View {
        TabView(selection: $tabViewSelection) {
            ForEach(0..<3, id: \.self) { index in
                Image("boarding\(index)")
                    .resizable()
                    .tag(index)
//                    .frame(width: 150, height: 150)
                    .padding(40)
                    .scaledToFit()
            }
        }
        .tabViewStyle(.page)
    }
    
    private var informationSection: some View {
        VStack(spacing: 17) {
            Text(boardingVM.titleText)
                .bold()
                .font(.title)
            
//            VStack(spacing: 2) {
//                HStack(spacing: 5) {
//                    Text("Please read our")
//
//                    Button {
//
//                    } label: {
//                        Text("privacy policy")
//                            .underline()
//                    }
//                }
//
//                HStack(spacing: 5) {
//                    Text("and")
//
//                    Button {
//
//                    } label: {
//                        Text("policy regarding")
//                            .underline()
//                    }
//
//                    Text("before registering")
//                }
//            }
            Text(boardingVM.subTitleText)
                .multilineTextAlignment(.center)
                .font(.callout)
                .foregroundColor(Color.gray)
                .frame(maxWidth: 300)
            
        }
    }
    
    private var buttonsSection: some View {
        VStack(spacing: 15) {
            if tabViewSelection == 2 {
                NavigationLink {
                    SignupView(isLogin: false)
                } label: {
                    Text("Next")
                        .bold()
                        .frame(height: 40)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
            } else {
                Button {
                    tabViewSelection += 1
                } label: {
                    Text("Next")
                        .bold()
                        .frame(height: 40)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
            }
            
            NavigationLink {
                SignupView(isLogin: false)
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
