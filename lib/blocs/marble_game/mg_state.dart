// marble_game_state.dart
part of 'mg_bloc.dart';

enum Player { none, player1, player2 }

abstract class MarbleGameState extends Equatable {
  final List<List<Player>> board;
  final Player currentPlayer;
  final bool gameWon;

  const MarbleGameState({
    required this.board,
    required this.currentPlayer,
    this.gameWon = false,
  });

  @override
  List<Object?> get props => [board, currentPlayer, gameWon];

  MarbleGameState copyWith({
    List<List<Player>>? board,
    Player? currentPlayer,
    bool? gameWon,
  }) {
    return MarbleGameState(
      board: board ?? this.board,
      currentPlayer: currentPlayer ?? this.currentPlayer,
      gameWon: gameWon ?? this.gameWon,
    );
  }
}
