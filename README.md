# Flick TV - OTT App Prototype

A functional and visually appealing video streaming application prototype for Android, built with Flutter. This project was created as a Flutter Developer Assignment to demonstrate proficiency in building modern mobile applications.

![Platform](https://img.shields.io/badge/Platform-Android-green.svg)
![Flutter](https://img.shields.io/badge/Flutter-3.x-blue.svg)

---

## 🎥 Demo

Here is a short demonstration of the application's user interface and core functionality, including the Netflix-style home screen and the reels-style video player.

<video controls width="400">
  <source src="https://raw.githubusercontent.com/yashchaudahri109/flick_tv/main/assets/flick_tv_demo.mp4" type="video/mp4">
  Your browser does not support the video tag.
</video>

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


---

## 🚀 Getting Started

### Prerequisites

*   Flutter SDK 3.35.4
*   Dart 3.9.2

### ⚠️ Important Compatibility Note

The assignment required using **`better_player: ^0.0.84`**. This version is incompatible with modern Android Gradle builds and will cause a build failure due to a missing `namespace` declaration in its native Android configuration.

**Solution Implemented:** Instead of upgrading the package, the library's source files were **manually patched** to resolve the issue while adhering to the specified version.

### Installation & Running

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/yashchaudhari109/flick_tv.git
    cd flick_tv
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



## 📲 Download APK

You can download and install the release APK directly from the link below.

**[➡️ Download Flick TV APK](https://drive.google.com/file/d/1ITyQU7fJ7DD_3mdPUkQU7p29fEPk_nYs/view?usp=sharing)**
