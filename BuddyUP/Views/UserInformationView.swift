//
//  UserInformationView.swift
//  BuddyUP
//
//  Created by Kimleng Hor on 8/6/23.
//

import SwiftUI

struct UserInformationView: View {
    
    @State private var nameText: String = ""
    
    @State private var isMale: Bool = false
    
    @State private var monthText: String = ""
    @State private var dayText: String = ""
    @State private var yearText: String = ""
    
    @State private var selection = "United States"
    let colors = ["United States", "Canada", "United Kingdom", "Germany", "France", "Italy", "Australia", "Japan", "China", "India", "Brazil", "Mexico", "South Korea", "Spain", "Netherlands", "Russia", "Switzerland", "Sweden", "Norway", "South Africa"]
    
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
        HStack {
            VStack(alignment: .leading, spacing: 15) {
                textFieldTitle("First name")
                CustomTextField(text: $nameText, placeholder:  "First name here", cornerRadius: 10, height: 60)
            }
            
            VStack(alignment: .leading, spacing: 15) {
                textFieldTitle("Last name")
                CustomTextField(text: $nameText, placeholder:  "Last name here", cornerRadius: 10, height: 60)
            }
        }
    }
    
    private var dateOfBirthSection: some View {
        VStack(alignment: .leading, spacing: 15) {
            textFieldTitle("Date of birth")
            HStack {
                CustomTextField(text: $monthText, placeholder: "Month", cornerRadius: 10, height: 60)
                CustomTextField(text: $dayText, placeholder: "Day", cornerRadius: 10, height: 60)
                CustomTextField(text: $yearText, placeholder: "Year", cornerRadius: 10, height: 60)
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
                    isMale = true
                } label: {
                    !isMale
                    ? Text("Male")
                        .withDefaultButtonFormatting(
                            backgroundColor: Color.theme.accent.opacity(0.15),
                            foregroundColor: Color.theme.accent)
                    : Text("Male")
                        .withDefaultButtonFormatting()
                }
                
                Button {
                    isMale = false
                } label: {
                    isMale
                    ? Text("Female")
                        .withDefaultButtonFormatting(
                            backgroundColor: Color.theme.accent.opacity(0.15),
                            foregroundColor: Color.theme.accent)
                    : Text("Female")
                        .withDefaultButtonFormatting()
                }
            }
        }
    }
    
    private var continueButton: some View {
        NavigationLink {
            MyInterestsView()
        } label: {
            Text("Continue")
                .withDefaultButtonFormatting(
                    backgroundColor: Color.theme.accent.opacity(0.15),
                    foregroundColor: Color.theme.accent)
        }
    }
}
