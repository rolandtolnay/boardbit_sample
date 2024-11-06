# Boardbit

## 📖 Description

**Boardbit** is a Flutter application designed for board game enthusiasts to log and track their game plays among different players, capturing detailed score breakdowns for each participant.

The main goal of the app is to provide an easy and comprehensive way to record who played, when they played, and how each player scored, creating a rich history of your board gaming sessions.

Additionally, it showcases a list of the top 20 hottest board games from BoardGameGeek for users to explore.

## 🎬 Demo

![App Demo](assets/demo/demo.gif)

## 🛠️ Technical Overview

This project is a technical sample aimed at demonstrating commonly used Flutter solutions:

- **Riverpod State Management**: Utilizes the latest version of Riverpod with code generation for efficient state management.
- **Firebase Backend Integration**: Implements Firebase services with anonymous authentication.
- **Simplified CLEAN Architecture**: Adopts a feature-based folder structure with separation between domain and presentation layers.
- **BGG XML API**: Fetches board game data using the [BoardGameGeek XML API](https://boardgamegeek.com/wiki/page/BGG_XML_API2) and includes an XML to JSON parser for data interpretation.

## 🎮 Features

- **User Onboarding**: A short onboarding where the user introduces their name.
- **Hot Games List**: View a list of the top 20 hottest board games from BoardGameGeek.
- **Add New Play**: Tap the central tab bar button to add a new game play.
  - **Select Board Game**: Choose the board game that was played.
  - **Select Date**: Pick the date of the game session.
  - **Manage Participants**: Select saved players or add new ones as participants.
  - **Score Entry**: Add scores for each participant with detailed breakdowns to capture different game scoring objectives.
- **Play History**: View a list of saved plays in the play list tab.

## 🛠️ Installation

### Prerequisites

- **Flutter SDK**: [Install Flutter](https://flutter.dev/docs/get-started/install)
- **FVM (Flutter Version Management)**: [Install FVM](https://fvm.app/documentation/getting-started/installation)
- **Firebase CLI**: [Install Firebase CLI](https://firebase.google.com/docs/cli)

### Steps

1. **Clone the Repository**

   ```bash
   git clone https://github.com/yourusername/your-repo-name.git
   cd your-repo-name
   ```

2. **Install FVM**

   Follow the instructions to install FVM:

   ```bash
   brew tap leoafarias/fvm
   brew install fvm
   ```

   _Note: Adjust the installation command based on your OS._

3. **Install the Flutter Version via FVM**

   ```bash
   fvm install
   fvm use
   ```

4. **Install Dependencies**

   ```bash
   fvm flutter pub get
   ```

5. **Set Up Firebase**

   The project requires Firebase to run successfully. Use the FlutterFire CLI tool to set up Firebase:

   - Install FlutterFire CLI:

     ```bash
     dart pub global activate flutterfire_cli
     ```

   - Configure Firebase for both development and production environments by following the [Firebase Flutter setup guide](https://firebase.google.com/docs/flutter/setup).

   - The project uses two Firebase configuration files:

     - `firebase_options_dev.dart` for development
     - `firebase_options_prod.dart` for production

6. **Run the App**

   Run the app in the development environment:

   ```bash
   fvm flutter run -t "lib/main_dev.dart"
   ```

   _Note: The current environment separation solution is specific to this sample app. In a production app, the correct approach would be to have separate bundle IDs and configured flavors. This was outside the scope of this sample._
