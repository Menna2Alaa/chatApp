# Scholar Chat App

A simple real-time chat application built with Flutter and Firebase, designed for seamless communication between users.

## Features

- **User Authentication**: Secure sign-up and sign-in functionality using Firebase Authentication
- **Real-time Messaging**: Instant message delivery and synchronization across devices
- **Clean UI**: Modern and intuitive chat interface with custom bubble designs
- **Cross-platform**: Supports Android, iOS, Web, Windows, and macOS

## Screenshots

The app features a clean, scholar-themed design with:
- Login and registration screens with the Scholar Chat branding
- Real-time chat interface with message bubbles
- Responsive design that works across different screen sizes

## Technologies Used

- **Flutter**: Cross-platform mobile development framework
- **Firebase**: Backend services including:
  - Firebase Authentication for user management
  - Cloud Firestore for real-time message storage
- **Bloc/Cubit**: State management for handling app states
- **Dart**: Programming language

## Project Structure

```
lib/
├── cubits/          # State management (Login, Register, Chat)
├── models/          # Data models (Message)
├── screens/         # UI screens (Login, Sign Up, Chat)
├── widgets/         # Reusable UI components
├── constants.dart   # App constants and colors
└── main.dart       # App entry point
```

## Key Components

- **Authentication Flow**: Complete user registration and login system
- **Chat System**: Real-time messaging with Firebase Firestore
- **State Management**: Organized with separate Cubits for different features
- **Custom Widgets**: Reusable components for consistent UI

## Getting Started

1. Clone the repository
2. Install Flutter dependencies: `flutter pub get`
3. Configure Firebase for your project
4. Run the app: `flutter run`

## Firebase Configuration

The app uses Firebase for backend services. Make sure to:
- Set up a Firebase project
- Enable Authentication and Firestore
- Add your Firebase configuration files

This chat app provides a solid foundation for real-time messaging applications with room for additional features like file sharing, group chats, and more.
