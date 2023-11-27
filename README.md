
# Travelo Authentication Application

## Description
A simple user authentication authentication application

## Application Download Link
- [Download Travelo](https://drive.google.com/file/d/15Cm796jVFAjlMso34PdckQmTxIhZLLlf/view?usp=sharing)


## Responsibilities
As the creator of Travelo, my responsibilities included:

 - App Development: Developing and designing the CraftyBay ecommerce app, ensuring a user-friendly interface and smooth navigation.

 - User Sign-In: Creating a seamless user sign-in process.

 - User Sign-Up: Creating a seamless user sign-up process.

 - Navigation: Implementing navigation for this application.

 - Design & Functionality: Designing an attractive, gorgeous UI and implementing all functionality.

 - State Management: Managing state for a better user experience.

## Challenges Faced
During the development of Travelo, I did not face any significant problems.

## How Challenges Were Overcome
Those challenges were overcome with online resources such as documentation and videos.

## Travelo UI

<div style="display: flex; flex-wrap: wrap;">
   <img src="https://github.com/hredhayxz/travelo/blob/main/screenshots/Screenshot_1.png" width="200" />
  <img src="https://github.com/hredhayxz/travelo/blob/main/screenshots/Screenshot_2.png" width="200" />
  <img src="https://github.com/hredhayxz/travelo/blob/main/screenshots/Screenshot_3.png" width="200" />
  <img src="https://github.com/hredhayxz/travelo/blob/main/screenshots/Screenshot_4.png" width="200" />
  <img src="https://github.com/hredhayxz/travelo/blob/main/screenshots/Screenshot_5.png" width="200" />
  <img src="https://github.com/hredhayxz/travelo/blob/main/screenshots/Screenshot_6.png" width="200" />
  <img src="https://github.com/hredhayxz/travelo/blob/main/screenshots/Screenshot_7.png" width="200" />
  <img src="https://github.com/hredhayxz/travelo/blob/main/screenshots/Screenshot_8.png" width="200" />
  <img src="https://github.com/hredhayxz/travelo/blob/main/screenshots/Screenshot_9.png" width="200" />
</div>


## Getting Started

### Prerequisites

Ensure Flutter is installed on your machine. For installation instructions, refer to the official [Flutter website](https://flutter.dev/docs/get-started/install).

### Installation

Follow these steps to run the News Read Application:

1. Clone this repository to your local machine:

```bash
git clone https://github.com/hredhayxz/travelo.git
```

2. Navigate to the project folder:

```bash
cd travelo
```

3. Install dependencies:

```bash
flutter pub get
```

### How to Run

Connect your device or emulator and run the app using the following command:

```bash
flutter run
```

## Used Packages

Travelo integrates the following packages to enhance functionality:
- `http: ^1.1.0`: The HTTP package provides a straightforward way to make HTTP requests in your Flutter app. It's essential for fetching data from APIs and working with web services.
- `flutter_svg: ^2.0.9`: A Flutter package for rendering SVG (Scalable Vector Graphics) images. It allows you to easily display and manipulate SVG files in your Flutter application.
- `get: ^4.6.6`: Get is a state management library for Flutter that simplifies the process of managing application state. It provides a clean and efficient way to handle state and dependencies in your app.
- `pin_code_text_field: ^1.8.0`: Pin Code Fields is a Flutter package that helps you implement PIN or OTP input fields in your app. It's highly customizable and easy to use for user authentication and verification.
- `flutter_launcher_icons: ^0.13.1`: This package simplifies the process of generating and setting app icons for your Flutter application. It allows you to customize app icons with ease.
- `shared_preferences: ^2.2.2`: Shared Preferences is a Flutter package for persisting simple key-value data in a platform-agnostic manner. It's commonly used for storing app settings and small amounts of data.
- `animated_bottom_navigation_bar: ^1.3.0`: For design animated bottom navigation bar.


## Project Directory Structure

The Travelo directory structure is organized as follows:

```

.
├── travelo/
├── ├── assets/
├── │   └── images/
├── │       ├── bg_circles.svg
├── │       ├── congrats.gif
├── │       └── facebook.svg
├── │       ├── google.svg
├── │       ├── person_icon.svg
├── │       └── travelo_logo.svg
├── │       └── travelologo.png
└── └── lib/
    ├── ├── application/
    ├── │   ├── app.dart
    ├── │   └── state_holder_binder.dart
    ├── ├── data/
    ├── │   ├── models/
    ├── │   │   ├── network_response.dart
    ├── │   ├── services/
    ├── │   │   └── network_caller.dart
    ├── │   └── utility/
    ├── │       └── urls.dart
    ├── ├── presentation/
    ├── │   ├── state_holders/
    ├── │   │   ├── auth/
    ├── │   │   │   ├── auth_and_navigation_controller.dart
    ├── │   │   │   ├── otp_verification_controller.dart
    ├── │   │   │   ├── signin_screen_controller.dart
    ├── │   │   │   ├── signup_screen_controller.dart/
    │   └── │   ├── bottom_nav_controller.dart
    ├── │   └── ui/
    ├── │       ├── screens/
    ├── │       │   ├── auth/
    ├── │       │   │   ├── otp_verification_screen.dart
    ├── │       │   │   ├── signin_screen.dart
    ├── │       │   │   ├── signup_screen.dart
    ├── │       │   ├── home_screen.dart
    ├── │       │   ├── splash_screen.dart
    ├── │       ├── utility/
    ├── │       │   └── assets_path.dart
    ├── │       └── widgets/
    ├── │           ├── congratulations_custom_dialog.dart
    ├── │           ├── form_container.dart
    ├── │           ├── optional_signup_login_container.dart
    ├── │           ├── social_signup_logIn_section.dart
    └── └── main.dart

```

## Contributors

- [Md Alhaz Mondal Hredhay](https://github.com/hredhayxz)

