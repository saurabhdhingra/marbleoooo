// marble_game_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'mg_event.dart';
import 'mg_state.dart';

class MarbleGameBloc extends Bloc<MarbleGameEvent, MarbleGameState> {
  MarbleGameBloc()
      : super(MarbleGameState(
          board: List.generate(4, (_) => List.filled(4, Player.none)),
          currentPlayer: Player.player1,
        )) {
    on<PlaceMarbleEvent>(_onPlaceMarble);
    on<RotateBoardEvent>(_onRotateBoard);
  }

  void _onPlaceMarble(PlaceMarbleEvent event, Emitter<MarbleGameState> emit) {
    if (state.board[event.row][event.col] != Player.none || state.gameWon) {
      return;
    }

    List<List<Player>> newBoard =
        List.from(state.board.map((row) => List.from(row)));
    newBoard[event.row][event.col] = state.currentPlayer;

    bool gameWon = _checkWin(newBoard, state.currentPlayer);
    emit(state.copyWith(
      board: newBoard,
      currentPlayer: state.currentPlayer == Player.player1
          ? Player.player2
          : Player.player1,
      gameWon: gameWon,
    ));
  }

  void _onRotateBoard(RotateBoardEvent event, Emitter<MarbleGameState> emit) {
    List<List<Player>> rotatedBoard = _rotateCounterClockwise(state.board);
    emit(state.copyWith(board: rotatedBoard));
  }

  List<List<Player>> _rotateCounterClockwise(List<List<Player>> board) {
    // Implement the logic to rotate the 4x4 board counterclockwise
    List<List<Player>> newBoard =
        List.generate(4, (_) => List.filled(4, Player.none));
    for (int row = 0; row < 4; row++) {
      for (int col = 0; col < 4; col++) {
        newBoard[3 - col][row] = board[row][col];
      }
    }
    return newBoard;
  }

  bool _checkWin(List<List<Player>> board, Player player) {
    // Implement win-checking logic here
    // Return true if there are 4 in a row for the player
    // Check rows, columns, and diagonals
    return false; // Replace with actual win-checking logic
  }
}
