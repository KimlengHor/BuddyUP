//
//  MyInterestsView.swift
//  BuddyUP
//
//  Created by Kimleng Hor on 8/7/23.
//

import SwiftUI

struct MyInterestsView: View {
    
    let interests = ["TV show", "music", "books", "sport", "shopping", "movie", "games", "drinks", "social n.", "family", "pets", "art", "dance", "bars", "travel", "wine tasting"]
    
    var body: some View {
        VStack {
            interestTopic
            
            Spacer()
            
            continueButton
        }
        .padding(24)
        .navigationTitle("My interests")
    }
}

struct MyInterestsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MyInterestsView()
        }
    }
}

extension MyInterestsView {
    private var interestTopic: some View {
        GeometryReader { geometry in
            self.generateContent(in: geometry)
        }
    }
    
    private var continueButton: some View {
        Button {
            
        } label: {
            Text("Continue")
                .withDefaultButtonFormatting(
                    backgroundColor: Color.theme.accent.opacity(0.15),
                    foregroundColor: Color.theme.accent)
        }
    }
}

extension MyInterestsView {
    private func generateContent(in g: GeometryProxy) -> some View {
            var width = CGFloat.zero
            var height = CGFloat.zero

            return ZStack(alignment: .topLeading) {
                ForEach(self.interests, id: \.self) { interest in
                    self.item(for: interest)
                        .alignmentGuide(.leading, computeValue: { d in
                            if (abs(width - d.width) > g.size.width) {
                                width = 0
                                height -= d.height
                            }
                            let result = width
                            if interest == self.interests.last! {
                                width = 0 //last item
                            } else {
                                width -= d.width
                            }
                            return result
                        })
                        .alignmentGuide(.top, computeValue: {d in
                            let result = height
                            if interest == self.interests.last! {
                                height = 0 // last item
                            }
                            return result
                        })
                }
            }
        }

        func item(for text: String) -> some View {
            Button {
            
            } label: {
                Text(text)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .withRoundBordered()
                    .padding([.trailing, .bottom], 16)
            }
        }
}
