// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:marbleoooo/utils/board_helper.dart';
// import '../../models/player.dart';
// import 'mg_event.dart';
// import 'mg_state.dart';

// class MarbleGameBloc extends Bloc<MarbleGameEvent, MarbleGameState> {
//   MarbleGameBloc()
//       : super(NewGame(
//           board: List.generate(4, (_) => List.filled(4, null)),
//           currentPlayer: Player.one,
//         )) {
//     on<Player1Move>((event, emit) {
//       List<List<Player?>> newBoard = _copyBoard(state.board);

//       newBoard[event.row][event.col] = Player.one;

//       newBoard = BoardHelper.rotateBoard(newBoard);

//       if (BoardHelper.checkWinCondition(newBoard, Player.one)) {
//         emit(Player1Won(board: newBoard));
//       } else if (BoardHelper.checkWinCondition(newBoard, Player.two)) {
//         emit(Player2Won(board: newBoard));
//       } else {
//         emit(Player2Turn(board: newBoard, currentPlayer: Player.two));
//       }
//     });

//     on<Player2Move>((event, emit) {
//       List<List<Player?>> newBoard = _copyBoard(state.board);

//       newBoard[event.row][event.col] = Player.two;

//       newBoard = BoardHelper.rotateBoard(newBoard);

//       if (BoardHelper.checkWinCondition(newBoard, Player.two)) {
//         emit(Player2Won(board: newBoard));
//       } else if (BoardHelper.checkWinCondition(newBoard, Player.one)) {
//         emit(Player1Won(board: newBoard));
//       } else {
//         emit(Player1Turn(board: newBoard, currentPlayer: Player.one));
//       }
//     });

//     on<NewGameInitiated>((event, emit) {
//       emit(NewGame(
//         board: List.generate(4, (_) => List.filled(4, null)),
//         currentPlayer: Player.one,
//       ));
//     });
//   }

//   List<List<Player?>> _copyBoard(List<List<Player?>> board) {
//     return board.map((row) => List<Player?>.from(row)).toList();
//   }
// }

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marbleoooo/utils/board_helper.dart';
import '../../models/player.dart';
import 'mg_event.dart';
import 'mg_state.dart';

class MarbleGameBloc extends Bloc<MarbleGameEvent, MarbleGameState> {
  MarbleGameBloc() : super(NewGame()) {
    
    on<Player1Move>((event, emit) {
      List<List<Player?>> newBoard = _copyBoard(state.board);

      newBoard[event.row][event.col] = Player.one;

      newBoard = BoardHelper.rotateBoard(newBoard);

      if (BoardHelper.checkWinCondition(newBoard, Player.one)) {
        emit(Player1Won(board: newBoard));
      } else if (BoardHelper.checkWinCondition(newBoard, Player.two)) {
        emit(Player2Won(board: newBoard));
      } else {
        emit(Player2Turn(board: newBoard));
      }
    });

    on<Player2Move>((event, emit) {
      List<List<Player?>> newBoard = _copyBoard(state.board);

      newBoard[event.row][event.col] = Player.two;

      newBoard = BoardHelper.rotateBoard(newBoard);

      if (BoardHelper.checkWinCondition(newBoard, Player.two)) {
        emit(Player2Won(board: newBoard));
      } else if (BoardHelper.checkWinCondition(newBoard, Player.one)) {
        emit(Player1Won(board: newBoard));
      } else {
        emit(Player1Turn(board: newBoard));
      }
    });

    on<NewGameInitiated>((event, emit) {
      emit(NewGame());
    });
  }

  List<List<Player?>> _copyBoard(List<List<Player?>> board) {
    return board.map((row) => List<Player?>.from(row)).toList();
  }
}
