# timesTables

A simple and interactive SwiftUI app to practice multiplication tables with customizable settings.

## Overview

This app helps users practice their multiplication skills by generating random multiplication questions based on selected settings. Users can choose the range of times tables and the number of questions, answer them, and receive a score at the end.

## Features

- Select the maximum times table (from 2 to 12).  
- Choose the number of questions (5, 10, or 20).  
- Randomly generates multiplication questions based on settings.  
- Input answers through a numeric text field.  
- Displays score after all questions are answered.  
- Option to play again and reset the game.

## How It Works

- **Settings Screen:** Users pick the maximum times table and number of questions.  
- **Gameplay:** Questions are generated randomly and presented one at a time.  
- Users enter their answer and submit to check correctness.  
- **Score Screen:** Shows the final score and option to restart.

## Code Structure

- `ContentView`: Main view that handles settings, gameplay, and score display.  
- `Question` struct: Represents a single multiplication question and its answer.  
- State variables manage game state, user input, questions array, and score.

## How to Use

1. Launch the app.  
2. Adjust the maximum times table using the stepper.  
3. Select the number of questions.  
4. Tap "Start Game" to begin.  
5. Enter answers and submit each question.  
6. At the end, view your score and choose to play again.

## Technical Details

- Built with SwiftUI for iOS.  
- Uses state management (`@State`) to handle game logic and UI updates.  
- Generates questions by creating pairs of numbers within the selected range and randomly selecting questions.  
- Validates user input and increments score on correct answers.

## Requirements

- Xcode 14 or later.  
- iOS 15 or later.
