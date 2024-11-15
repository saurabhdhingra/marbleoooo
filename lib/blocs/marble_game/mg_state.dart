import '../../models/player.dart'; // Assuming Player model is defined in this file

abstract class MarbleGameState {
  final List<List<Player?>> board;
  final Player currentPlayer;

  const MarbleGameState({
    required this.board,
    required this.currentPlayer,
  });
}

class Player1Turn extends MarbleGameState {
  Player1Turn({
    required List<List<Player?>> board,
    currentPlayer = Player.one,
  }) : super(board: [], currentPlayer: Player.one);
}

class Player2Turn extends MarbleGameState {
  Player2Turn({
    required List<List<Player?>> board,
    currentPlayer = Player.two,
  }) : super(board: [], currentPlayer: Player.two);
}

class Player1Won extends MarbleGameState {
  Player1Won() : super(board: [], currentPlayer: Player.one);
}

class Player2Won extends MarbleGameState {
  Player2Won() : super(board: [], currentPlayer: Player.two);
}

class NewGame extends MarbleGameState {
  NewGame({
    required List<List<Player?>> board,
    currentPlayer = Player.one,
  }) : super(board: [], currentPlayer: Player.one);
}
