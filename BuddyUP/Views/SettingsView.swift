//
//  SettingsView.swift
//  BuddyUP
//
//  Created by Kimleng Hor on 8/8/23.
//

import SwiftUI
import Sliders

struct SettingsView: View {
    
    @State private var globalToggle: Bool = false
    @State private var profileToggle: Bool = false
    @State private var stickerToggle: Bool = false
    
    @State private var distance: Float = 0
    @State var ageRange = 0.2...0.8
    
    var body: some View {
        ScrollView {
            VStack(spacing: 18) {
                locationSection
                
                distanceSection
                
                preferredGenderSection
                
                ageRangeSection
                
                globalSection
                
                showMeProfileSection
                
                showMStickerSection
            }
        }
        .navigationTitle("Settings")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    
                } label: {
                    Text("Done")
                        .bold()
                }

            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SettingsView()
        }
    }
}

extension SettingsView {
    private var locationSection: some View {
        VStack {
            Divider()
                .padding(.top, 18)
            
            settingsSection(title: "Location", info: "Cecilia Chapman 711-2880 Nulla St. Mankato")
        }
    }
    
    private var distanceSection: some View {
        VStack(spacing: 18) {
            Divider()
            
            settingsSection(title: "Maximum distance", info: "80 km")
            Slider(value: $distance)
                .padding(.horizontal, 20)
        }
    }
    
    private var preferredGenderSection: some View {
        VStack(spacing: 18) {
            Divider()
            
            settingsSection(title: "Show me for", info: "Male")
        }
    }
    
    private var ageRangeSection: some View {
        VStack(spacing: 18) {
            Divider()
            
            settingsSection(title: "Age range", info: "18 - 65")
            
            RangeSlider(range: $ageRange)
                .rangeSliderStyle(
                        HorizontalRangeSliderStyle(
                            track:
                                HorizontalRangeTrack(
                                    view: Capsule().foregroundColor(Color.theme.accent)
                                )
                                .background(Capsule().foregroundColor(Color.gray.opacity(0.25)))
                                .frame(height: 4),
                            lowerThumbSize: CGSize(width: 27, height: 27),
                            upperThumbSize: CGSize(width: 27, height: 27),
                            options: .forceAdjacentValue
                        )
                    )
                .padding(.horizontal, 24)
                
        }
    }
    
    private var globalSection: some View {
        VStack(alignment: .leading, spacing: 18) {
            Divider()
            
            Toggle(isOn: $globalToggle) {
                boldText(text: "Global")
            }
            .padding(.horizontal, 24)
            
            Divider()
            
            grayInfoText(text: "The global mode turns on as soon as the profiles in this location run out")
                .padding(.horizontal, 24)
        }
    }
    
    private var showMeProfileSection: some View {
        VStack(spacing: 18) {
            Divider()
            
            Toggle(isOn: $profileToggle) {
                boldText(text: "Show me with profile")
            }
            .padding(.horizontal, 24)
        }
    }
    
    private var showMStickerSection: some View {
        VStack(alignment: .leading, spacing: 18) {
            Divider()
            
            Toggle(isOn: $stickerToggle) {
                boldText(text: "Show me with sticker")
            }
            .padding(.horizontal, 24)
            
            Divider()
            
            grayInfoText(text: "You can turn off the profile function and only turn on the sticker system. All participants will see and find you only by the sticker.")
                .padding(.horizontal, 24)
        }
    }
}

extension SettingsView {
    private func boldText(text: String) -> some View {
        Text(text)
            .bold()
    }
    
    private func grayInfoText(text: String) -> some View {
        Text(text)
            .font(.callout)
            .foregroundColor(.gray)
    }
    
    private func settingsSection(title: String, info: String) -> some View {
        HStack {
            boldText(text: title)
            Spacer()
            grayInfoText(text: info)
        }
        .padding(.horizontal, 24)
    }
}
