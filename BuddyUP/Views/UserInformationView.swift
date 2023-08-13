//
//  UserInformationView.swift
//  BuddyUP
//
//  Created by Kimleng Hor on 8/6/23.
//

import SwiftUI

struct UserInformationView: View {
    
    @State private var nameText: String = ""
    
    @State private var monthText: String = ""
    @State private var dayText: String = ""
    @State private var yearText: String = ""
    
    @State private var selection = "Red"
    let colors = ["Red", "Green", "Blue", "Black", "Tartan"]
    
    var body: some View {
        VStack {
            VStack(spacing: 33) {
                nameSection
                
                dateOfBirthSection
                
                countrySection
                
                genderSection
            }
            Spacer()
            
            continueButton
        }
        .navigationTitle("Personal")
        .padding(24)
    }
}

struct UserInformationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            UserInformationView()
        }
    }
}

extension UserInformationView {
    private func textFieldTitle(_ title: String) -> some View {
        Text(title)
            .font(.callout)
            .foregroundColor(.gray)
    }
    
    private var nameSection: some View {
        VStack(alignment: .leading, spacing: 15) {
            textFieldTitle("Enter your name")
            CustomTextField(text: $nameText, placeholder:  "Enter your name here")
        }
    }
    
    private var dateOfBirthSection: some View {
        VStack(alignment: .leading, spacing: 15) {
            textFieldTitle("Date of birth")
            HStack {
                CustomTextField(text: $monthText, placeholder: "Month")
                CustomTextField(text: $dayText, placeholder: "Day")
                CustomTextField(text: $yearText, placeholder: "Year")
            }
        }
    }
    
    private var countrySection: some View {
        VStack(alignment: .leading, spacing: 15) {
            textFieldTitle("Choose your country")
            HStack {
                Menu {
                    Picker("Select", selection: $selection) {
                        ForEach(colors, id: \.self) {
                            Text($0)
                        }
                    }
                } label: {
                    HStack {
                        Text(selection)
                        Spacer()
                        Image(systemName: "chevron.down")
                    }
                    .frame(maxWidth: .infinity)
                    .padding(20)
                }.id(selection)
                
                Spacer()
            }
            .withRoundBordered()
        }
    }
    
    private var genderSection: some View {
        VStack(alignment: .leading, spacing: 15) {
            textFieldTitle("Gender")
            HStack {
                Button {
                    
                } label: {
                    Text("Male")
                        .withDefaultButtonFormatting(
                            backgroundColor: Color.theme.accent.opacity(0.15),
                            foregroundColor: Color.theme.accent)
                }
                
                Button {
                    
                } label: {
                    Text("Female")
                        .withDefaultButtonFormatting()
                }
            }
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
