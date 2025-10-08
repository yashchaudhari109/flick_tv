# Flick TV - OTT App Prototype

A functional and visually appealing video streaming application prototype for Android, built with Flutter. This project was created as a Flutter Developer Assignment to demonstrate proficiency in building modern mobile applications.

![Platform](https://img.shields.io/badge/Platform-Android-green.svg)
![Flutter](https://img.shields.io/badge/Flutter-3.x-blue.svg)

---

## 🎥 Demo

Here is a short demonstration of the application's user interface and core functionality, including the Netflix-style home screen and the reels-style video player.

*(**Instructions:** The demo video `assets/flick_tv_demo.mp4` is included in the repository. Replace the placeholders below with your GitHub username and repository name to embed the video directly.)*

```markdown
![App Demo Video](https://raw.githubusercontent.com/YOUR_USERNAME/YOUR_REPO_NAME/main/assets/flick_tv_demo.mp4)```

**Tip:** For auto-playing demos, you can convert the MP4 to a GIF and embed it as an image.

---

## ✨ Features

*   **Netflix-Style Home Page:** A vertically scrolling interface featuring multiple horizontally scrolling carousels with different layouts (portrait and landscape).
*   **Reels-Style Video Player:** An immersive, full-screen video player with vertical swipe gestures to navigate between videos.
*   **BLoC State Management:** Follows the BLoC pattern for predictable and scalable state management.
*   **MVVM Architecture:** A clean separation of concerns between the UI (View), business logic (ViewModel/BLoC), and data (Model).
*   **Declarative Navigation:** Uses `go_router` for a robust and type-safe routing solution.
*   **Local Data Source:** Parses a local `mock.json` file to populate the UI.
*   **Polished & Reusable UI:** Built with reusable widgets, a custom theme, and a well-organized project structure.

---

## 🛠️ Technical Specifications & Architecture

*   **Framework:** Flutter (Latest Stable)
*   **Platform:** Android
*   **State Management:** `flutter_bloc`
*   **Architecture:** MVVM (Model-View-ViewModel) + BLoC
*   **Navigation:** `go_router`
*   **Video Player:** `better_player`
*   **Data Handling:** Local JSON parsing

### Project Structure

The project maintains a strict, scalable structure to ensure clean and maintainable code.

```
lib/
├── app.dart
├── main.dart
│
├── core/
│   ├── app_theme.dart
│   ├── constants/
│   │   ├── app_constants.dart
│   │   └── asset_constants.dart
│   └── navigation/
│       └── app_router.dart
│
├── data/
│   ├── models/
│   │   └── video_model.dart
│   ├── providers/
│   │   └── local_data_provider.dart
│   └── repositories/
│       └── video_repository.dart
│
└── presentation/
├── blocs/
│   └── home/
│       ├── home_bloc.dart
│       ├── home_event.dart
│       └── home_state.dart
├── pages/
│   ├── home_page.dart
│   └── video_player_page.dart
└── widgets/
├── carousel_row.dart
├── single_video_player_item.dart
└── video_thumbnail_card.dart
```

---

## 🚀 Getting Started

### Prerequisites

*   Flutter SDK (version 3.x)
*   An Android device or emulator

### ⚠️ Important Compatibility Note

The original assignment specified using `better_player: ^0.0.84`. This version is **not compatible** with modern Flutter/Android Gradle builds due to a missing `namespace` declaration, which causes a build failure.

**Solution Implemented:** This project has been updated to use **`better_player: ^0.0.99`** in the `pubspec.yaml` file. This version resolves the compatibility issues. No manual changes to the library are needed; simply follow the build instructions below.

### Installation & Running

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/your-username/your-repo-name.git
    cd your-repo-name
    ```

2.  **Get dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Run the application:**
    ```bash
    flutter run
    ```

### Building the APK

To build a release version of the APK, run the following command:

```bash
flutter build apk --release
```

The generated APK will be located at `build/app/outputs/flutter-apk/app-release.apk`.

---

## 📲 Download APK

You can download and install the release APK directly from the link below.

*(**Instructions:** Build the release APK using the command above. Upload the `app-release.apk` file to a service like Google Drive, Dropbox, or create a GitHub Release. **Make sure the link is public and directly downloadable.** Then, replace the placeholder.)*

**[➡️ Download Flick TV APK]([YOUR_PUBLIC_APK_DOWNLOAD_LINK_HERE])**