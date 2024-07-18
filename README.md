# Card Game App

## Table of Contents

- [Introduction](#Introduction)
- [Features](#Features)
- [Requirements](#Requirements)
- [Usage](#Usage)
- [ScreenShot](#ScreenShot)
- [vedio](#vedio)

# Introduction

MyGameApp is a mobile application that provides a simple yet engaging game where two players compete by flipping cards. The player's side (East or West) is determined based on their geographical location relative to a midpoint latitude of 34.817549168324334. Each card has a unique strength, and players score points based on the strength of their cards. The game consists of 10 rounds, and the player with the highest score at the end wins. If there is a draw, the house wins.

# Features

- **First-time User Experience**: When logging in for the first time, the user is prompted to enter their name. On subsequent logins, the name is displayed automatically.
- **Location-Based Side Assignment**: The app samples the user's location to determine their side (East or West).
- **Automatic Gameplay**: The game runs automatically, flipping cards every 5 seconds and displaying each card for 3 seconds.
- **Score Tracking**: Scores are updated in real-time based on the strength of the cards.
- **Game End and Summary**: After 10 rounds, the game ends and displays the winner along with the scores. A button to return to the main menu is provided.

# Requirements

- **Platform**: iOS 
- **Tools**: Xcode for iOS development
- **Emulator**: To test location-based features, a dummy location can be set through the emulator

# Usage

- **First-time Login**:
  - Open the app.
  - Enter your name when prompted.
- **Subsequent Logins**:
  - The app will display your name automatically.
- **Location Sampling**:
  - The app will sample your location and determine your side (East or West) based on the latitude 34.817549168324334.
  - The location request will stop once the location is received.
- **Gameplay**:
  - The game will start automatically.
  - Cards will flip every 5 seconds and display for 3 seconds.
  - Scores will be updated based on the strength of the cards.
- **Game End**:
  - After 10 rounds, the game will end and display the winner and the scores.
  - Use the "Back to Main Menu" button to return to the main menu.

# ScreenShot

![IMG_1259](https://github.com/user-attachments/assets/bcebce62-2659-4e05-ac65-eaf4a2ed4e06)
![IMG_1258](https://github.com/user-attachments/assets/d6d773c3-158a-4105-b94a-b50d463d62f3)
![IMG_1257](https://github.com/user-attachments/assets/dcb24062-f28e-4d90-a83e-45a5fd2b7bf5)
![IMG_1256](https://github.com/user-attachments/assets/ae46a350-328f-4ebc-9ca9-bac8e4ae5044)

# vedio

https://github.com/user-attachments/assets/10cf8ea9-e1ea-453f-8697-f1b6eb4733d7

