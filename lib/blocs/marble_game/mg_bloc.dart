// marble_game_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marbleoooo/utils/board_helper.dart';
import '../../models/player.dart';
import 'mg_event.dart';
import 'mg_state.dart';

class MarbleGameBloc extends Bloc<MarbleGameEvent, MarbleGameState> {
  MarbleGameBloc()
      : super(NewGame(board: List.generate(4, (_) => List.filled(4, null)))) {
    on<Player1Move>(
      ((event, emit) {
        List<List<Player?>> newBoard =
            List.from(state.board.map((row) => List.from(row)));

        newBoard[event.row][event.col] = state.currentPlayer;

        newBoard = BoardHelper.rotateBoard(newBoard);

        if (BoardHelper.checkWinCondition(newBoard, Player.one)) {
          emit(Player1Won());
        } else if (BoardHelper.checkWinCondition(newBoard, Player.two)) {
          emit(Player2Won());
        } else {
          emit(Player2Turn(board: newBoard));
        }
      }),
    );
    on<Player2Move>((event, emit) {
      List<List<Player?>> newBoard =
          List.from(state.board.map((row) => List.from(row)));

      newBoard[event.row][event.col] = state.currentPlayer;

      newBoard = BoardHelper.rotateBoard(newBoard);

      if (BoardHelper.checkWinCondition(newBoard, Player.two)) {
        emit(Player2Won());
      } else if (BoardHelper.checkWinCondition(newBoard, Player.one)) {
        emit(Player1Won());
      } else {
        emit(Player1Turn(board: newBoard));
      }
    });
    on<NewGameInitiated>((event, emit) {
      emit(
        NewGame(
          board: List.generate(4, (_) => List.filled(4, null)),
          currentPlayer: Player.one,
        ),
      );
    });
  }
}
