//
//  ContentView.swift
//  MySwiftProfile
//
//  Created by Francisco Casillas on 11/07/25.
//

import SwiftUI

class UserProfile: ObservableObject {
    @Published var profileImage: String = "sun.max.fill"
    @Published var name: String = "John Doe"
    @Published var age: Int = 0
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
                Text("Age: \(user.age)")
            }
            .padding()
            VStack {
                Text("Birthday: \(user.birthDay) \(user.birthMonth)")
                    .padding(.top, 15)
                Text("Fave color: \(user.favoriteColor)")
                Text("Favorite game: \(user.favoriteGame)")
                    .padding()
            }
            .padding()
        }
        .background(user.backgroundColor)
        .foregroundColor(user.foregroundColor)
        .cornerRadius(20)
        .shadow(color: .gray,radius: 10, x: 3, y: 7)
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
