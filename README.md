# Marble Game

A **Marble Game** implemented in Flutter using the **BLoC** (Business Logic Component) architecture. This project is a turn-based game for two players where players place marbles on a board, and the board rotates after each move. The game is designed to demonstrate clean architecture principles, state management, and a visually engaging UI.

---

## 🎯 **Features**

- **Dynamic Gameplay**: Players take turns placing marbles on a rotating board.
- **BLoC State Management**: Uses the `flutter_bloc` library to manage the game logic and states.
- **Custom Board UI**: Implements a custom-painted marble and board design.
- **Win Condition Check**: Automatically evaluates win conditions after each move.
- **New Game Option**: Reset the board and start a new game seamlessly.
- **Scalable Design**: Designed to support different board sizes easily.

---

## 🗂️ **File Structure**

The project follows a modular structure for better readability and maintainability:

```
lib/
├── blocs/
│   ├── marble_game/
│   │   ├── mg_bloc.dart          # BLoC logic for game state transitions
│   │   ├── mg_event.dart         # Events for game actions
│   │   ├── mg_state.dart         # States representing the game state
├── models/
│   ├── player.dart               # Player enumeration (Player.one, Player.two)
│   ├── position.dart             # Position model for board cells
├── screens/
│   ├── game_screen.dart          # UI for the Marble Game
├── utils/
│   ├── board_helper.dart         # Utility functions for board manipulation
│   ├── constants.dart            # Constants for building UI
│   ├── ui_utils.dart             # UI constants
├── widgets/
│   ├── custom_board.dart         # Widget to draw the game board
│   ├── custom_marble.dart        # Custom-painted marble widget
├── main.dart                     # Entry point of the application
```


## 🎮 **How to Play**

1. Player 1 starts the game by placing their marble on any empty cell.
2. After every move, the board rotates, adding a twist to the gameplay.
3. The game checks if Player 1 or Player 2 has won after each move.
4. The first player to achieve a winning condition (e.g., 3 in a row) is declared the winner.
5. Start a new game anytime by clicking the **New Game** button.

---

## ⚙️ **Technical Overview**

### 1. **State Management**
- The game state is managed using `flutter_bloc`.
- Event-driven state transitions ensure a clean separation of UI and logic.

### 2. **Custom Widgets**
- **CustomPainter** is used for rendering the marbles.

### 3. **Board Logic**
- The `BoardHelper` utility handles board rotation and win condition checks, ensuring the core game logic is reusable.


