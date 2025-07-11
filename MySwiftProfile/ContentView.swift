//
//  ContentView.swift
//  MySwiftProfile
//
//  Created by Francisco Casillas on 11/07/25.
//

import SwiftUI

class UserProfile: ObservableObject {
    @Published var profileImage: String = "heart.fill"
    @Published var name: String = "John Doe"
    @Published var age: Int = 0
    @Published var description: String = "Your bio"
    @Published var birthDay: Int = 1
    @Published var birthMonth: String = "January"
    @Published var favoriteColor: String = "blue"
    @Published var favoriteGame: String = "Animal Crossing"
    @Published var backgroundColor: Color = .black
    @Published var foregroundColor: Color = .white
}

struct ContentView: View {
    @StateObject var user = UserProfile()
    
    var body: some View {
        VStack {
            ProfileView(user: user)
            ProfileFormView(user: user)
        }
    }
}


struct ProfileView: View {
    @ObservedObject var user: UserProfile
    
    var body: some View {
        HStack {
            VStack {
                Image(systemName: user.profileImage)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding()
                Text(user.name)
                Text(String(user.age))
            }
            .padding()
            VStack {
                Text(user.description)
                    .multilineTextAlignment(.center)
                    .frame(width: 180)
                Text(String(user.birthDay) + " " + user.birthMonth)
                Text(user.favoriteColor)
                Text(user.favoriteGame)
            }
            .padding()
        }
        .background(user.backgroundColor)
        .foregroundColor(user.foregroundColor)
        .padding()
        }
}

struct ProfileFormView: View {
    @ObservedObject var user: UserProfile
    let icons = ["heart.fill", "square.and.arrow.up.on.square.fill", "sun.max.fill", "moon.fill", "moon.stars.fill"]
    let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    let colors = ["blue", "green", "yellow", "red", "purple", "orange", "pink", "brown", "gray", "black", "white"]    
    let uiColors: [Color] = [.blue, .green, .yellow, .red, .purple, .orange, .pink, .brown, .gray, .black, .white]
    let games = ["Animal Crossing", "Mario Kart", "Super Smash Bros", "The Legend of Zelda", "Overwatch"]
    
    var body: some View {
        Form {
            Section(header: Text("Options")) {
                Picker("Icon", selection: $user.profileImage ) {
                    ForEach(icons, id: \.self) { icon in
                        Text(icon)
                    }
                }
                TextField("Name", text: $user.name)
                TextField("Age", text: Binding(
                    get: { String(user.age) },
                    set: { newValue in
                        if let value = Int(newValue), (0...110).contains(value) {
                            user.age = value
                        }
                    }
                ))
                .keyboardType(.numberPad)
                TextEditor(text: $user.description)
                    .frame(minHeight: 100)
                Picker("Birth day", selection: $user.birthDay) {
                    ForEach(1..<32) { day in
                        Text("\(day - 1)")
                    }
                }
                Picker("Birth month", selection: $user.birthMonth) {
                    ForEach(months, id: \.self) { month in
                        Text("\(month)")
                    }
                }
                Picker("Favorite color", selection: $user.favoriteColor) {
                    ForEach (colors, id: \.self) { color in
                            Text(color)
                    }
                }
                Picker("Favorite game", selection: $user.favoriteGame) {
                    ForEach(games, id: \.self){ game in
                            Text(game)
                    }
                }
                ColorPicker ("Background color", selection: $user.backgroundColor)
                ColorPicker ("Font color", selection: $user.foregroundColor)
            }
        }
    }
}

#Preview {
    ContentView()
}
