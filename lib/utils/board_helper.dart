import '../models/player.dart';

class BoardHelper {
  static void rotateBoard(List<List<Player?>> board) {
    transpose(board);
    reverseRows(board);
  }

  static void transpose(List<List<Player?>> board) {
    for (int i = 0; i < board.length; i++) {
      for (int j = i; j < board.length; j++) {
        Player? temp = board[i][j];
        board[i][j] = board[j][i];
        board[j][i] = temp;
      }
    }
  }

  static void reverseRows(List<List<Player?>> board) {
    for (int r = 0; r < board.length; r++) {
      int left = 0;
      int right = board.length - 1;

      while (left < right) {
        Player? temp = board[r][left];
        board[r][left] = board[r][right];
        board[r][right] = temp;

        left++;
        right--;
      }
    }
  }

  static bool checkWinCondition(List<List<Player?>> board, Player player) {
    for (int i = 0; i < 4; i++) {
      if (board[i].every((cell) => cell == player)) return true;
      if (board.every((row) => row[i] == player)) return true;
    }

    if (List.generate(4, (i) => board[i][i]).every((cell) => cell == player)) {
      return true;
    }
    if (List.generate(4, (i) => board[i][3 - i])
        .every((cell) => cell == player)) {
      return true;
    }

    return false;
  }
}
