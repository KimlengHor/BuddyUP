//
//  MyInterestsView.swift
//  BuddyUP
//
//  Created by Kimleng Hor on 8/7/23.
//

import SwiftUI

struct MyInterestsView: View {
    
    @State private var showTabView: Bool = false
    
    let interests = ["Cooking/Baking", "Hiking", "Photography", "Gardening", "Painting/Drawing",
                     "Reading/Book Clubs", "Cycling", "Running/Jogging", "Traveling", "Yoga",
                     "Fishing", "Dancing", "Writing", "Knitting/Crocheting", "Board Games",
                     "Gaming", "Volunteering", "DIY/Crafting", "Music (Instrument Playing)", "Film/TV Shows",
                     "Swimming", "Meditation", "Chess", "Pottery", "Camping", "Singing",
                     "Puzzles", "Bird Watching", "Fitness/Weightlifting", "Skiing/Snowboarding", "Surfing",
                     "Scuba Diving", "Wine Tasting", "Collecting (Coins, Stamps, etc.)", "Rock Climbing", "Martial Arts",
                     "Sailing", "Skydiving", "Language Learning", "Astrology", "Paintball", "Archery",
                     "Parkour", "Horseback Riding", "Home Brewing", "Historical Reenactment", "Geocaching",
                     "Dog Training", "Ice Skating", "Amateur Radio", "Candle Making", "Beekeeping", "Aquarium Keeping",
                     "Fossil Hunting", "Metal Detecting", "Soap Making", "Sculpting", "DJing", "Robotics",
                     "Magic Tricks", "Kite Flying", "Ballet", "Paddleboarding", "Urban Gardening", "Foraging",
                     "Caving/Spelunking", "Astronomy", "Calligraphy", "Jewelry Making", "Woodworking", "Carpentry", "Bonsai",
                     "Archaeology", "Ceramics", "Fencing"]
    
    var body: some View {
        VStack {
            interestTopic
           
            Spacer()
            
            continueButton
        }
        .padding(24)
        .navigationTitle("My interests")
        .fullScreenCover(isPresented: $showTabView) {
            BuddyUPTabView()
        }
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
            ScrollView {
                self.generateContent(in: geometry)
            }
        }
    }
    
    private var continueButton: some View {
        Button {
            showTabView.toggle()
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
