# 👤 My Swift Profile

![Status](https://badgen.net/badge/status/completed/green)
![Type](https://badgen.net/badge/type/learning%20project/pink)
![Built in](https://badgen.net/badge/Built%20with/Xcode/blue)
![Coded with](https://badgen.net/badge/Written%20with/Swift/orange)
![Styling](https://badgen.net/badge/Styling/SwiftUI/purple)

MySwiftProfile is a SwiftUI app that lets users create and customize a digital profile card.  
Users can select their favorite icon, enter personal details like name, age, and birthdate, choose a favorite game and color, and instantly see the visual result.  
The interface is interactive and responsive, making it a smooth experience for customizing and previewing a personal profile in real time.

## 📷 Screenshot

<img width="1223" height="919" alt="Screenshot 2025-07-11 at 5 00 24 p m" src="https://github.com/user-attachments/assets/fe58a29b-a063-48aa-a5c5-99a47e70c87d" />

---

## 🔧 Features & Stack Used

- 🎨 UI built entirely with **SwiftUI**
- 📋 Interactive form built using `Form`, `TextField`, `Picker`, `Slider`, and `TextEditor`
- 🧠 Reactive data flow using `@StateObject`, `@ObservedObject`, and `@Published`
- 🎛️ Live customization of colors, corner radius, and icons
- 📱 SF Symbols used for profile icons
- 🌈 Real-time preview using two-way data binding
- 💼 Built with **Xcode** and version-controlled using **Git**

---

## 🧪 Highlighted Technical Detail

This project connects two separate views, a live preview and a form—using shared state via `@StateObject` and `@ObservedObject`.  
All fields in the form update the profile view in real time, including dynamic icon selection, and color themes.  
This architecture highlights the use of SwiftUI’s data flow model to keep UI components in sync with minimal code and no manual refresh logic.

---

## 🧠 Concepts Explored

- Data flow in SwiftUI using `@StateObject`, `@ObservedObject`, and `@Published`
- Building interactive forms with `Form`, `Picker`, `TextEditor`, and `Slider`
- Creating reactive previews with real-time data binding
- Organizing SwiftUI views across multiple files with clean structure

---

## 📁 Project Structure

```bash
/ContentView.swift     → Root view and shared state container
/ProfileView.swift     → Displays the live preview of the profile
/ProfileFormView.swift → Form with text fields, pickers and sliders
/UserProfile.swift     → ObservableObject model with @Published properties
```

---

## 🚧 Roadmap

- ✅ Form with live preview connection
- ✅ Real-time updates using `@ObservedObject` and `@Published`
- ✅ Color customization
- ⏳ Add form validation (e.g. required fields, valid age range)
- ⏳ Save/load profile data locally with `@AppStorage` or `UserDefaults`
- ⏳ Add light/dark mode adaptation

---

## 🚀 Getting Started

To run this app locally:

### Requirements
- Xcode 15 or newer
- macOS Ventura or later
- iOS Simulator or real device (iOS 16+)

### Steps

1. Clone this repository:
```bash
git clone https://github.com/your-username/FavoriteCharacters.git
```

2. Open the project in Xcode:
  ```bash
  open FavoriteCharacters.xcodeproj
  ```

3. Build and run the app on a simulator or real device.

---

## 🤝 Contact

Feel free to connect or reach out:

- [GitHub](https://github.com/franciscoxcode)
- [LinkedIn](https://www.linkedin.com/in/franciscoxcode/)
- [Email](mailto:fxcasillas.dev@gmail.com)

---

## 📄 License

This project is for educational and demonstration purposes only.  
Feel free to explore, clone, or adapt the code for your own learning or portfolio.

No third-party assets were used.

