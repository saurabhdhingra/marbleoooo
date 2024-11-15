import '../../models/player.dart'; 

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
  }) : super(board: board, currentPlayer: Player.one);
}

class Player2Turn extends MarbleGameState {
  Player2Turn({
    required List<List<Player?>> board,
  }) : super(board: board, currentPlayer: Player.two);
}

class Player1Won extends MarbleGameState {
  Player1Won({
    required List<List<Player?>> board,
  }) : super(board: board, currentPlayer: Player.one);
}

class Player2Won extends MarbleGameState {
  Player2Won({
    required List<List<Player?>> board,
  }) : super(board: board, currentPlayer: Player.two);
}

class NewGame extends MarbleGameState {
  NewGame()
      : super(
          board: List.generate(4, (_) => List.filled(4, null)),
          currentPlayer: Player.one,
        );
}
