import '../models/player.dart';

class BoardHelper {
  static List<List<Player?>> rotateBoard(List<List<Player?>> board) {
    List<List<Player?>> newBoard =
        List.generate(4, (_) => List.filled(4, null));

    for (int row = 0; row < 4; row++) {
      for (int col = 0; col < 4; col++) {
        // When the spot is empty
        if (board[row][col] == null) {
          continue;
        }

        // Handling all the edge cases first
        // I know ideally this should be done with keeping the general case of nxn matrices
        // but since we're dealing with a 4x4 board, I'll stick with this makeshift solution for now, as I had
        // less time to do this in the correct way.

        if (row == 0 && col == 0) {
          newBoard[1][0] = board[row][col];
        } else if (row == 3 && col == 0) {
          newBoard[3][1] = board[row][col];
        } else if (row == 3 && col == 3) {
          newBoard[2][3] = board[row][col];
        } else if (row == 0 && col == 3) {
          newBoard[0][2] = board[row][col];
        } else if (row == 1 && col == 1) {
          newBoard[2][1] = board[row][col];
        } else if (row == 2 && col == 1) {
          newBoard[2][2] = board[row][col];
        } else if (row == 2 && col == 2) {
          newBoard[1][2] = board[row][col];
        } else if (row == 1 && col == 2) {
          newBoard[1][1] = board[row][col];
        } else if (row == 0) {
          newBoard[row][col - 1] =
              board[row][col]; // moving marbles in the first row left
        } else if (row == 3) {
          newBoard[row][col + 1] =
              board[row][col]; // moving marbles in the last row right
        } else if (col == 0) {
          newBoard[row + 1][col] =
              board[row][col]; // moving marbles in the first column down
        } else if (col == 3) {
          newBoard[row - 1][col] =
              board[row][col]; // moving marbles in the last column up
        }
      }
    }

    return newBoard;
  }

  // static void transpose(List<List<Player?>> board) {
  //   for (int i = 0; i < board.length; i++) {
  //     for (int j = i; j < board.length; j++) {
  //       Player? temp = board[i][j];
  //       board[i][j] = board[j][i];
  //       board[j][i] = temp;
  //     }
  //   }
  // }

  // static void reverseRows(List<List<Player?>> board) {
  //   for (int r = 0; r < board.length; r++) {
  //     int left = 0;
  //     int right = board.length - 1;

  //     while (left < right) {
  //       Player? temp = board[r][left];
  //       board[r][left] = board[r][right];
  //       board[r][right] = temp;

  //       left++;
  //       right--;
  //     }
  //   }
  // }

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

  static bool checkDrawCondition(List<List<Player?>> board) {
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        if (board[i][j] == null) {
          return false;
        }
      }
    }

    return true;
  }
}
