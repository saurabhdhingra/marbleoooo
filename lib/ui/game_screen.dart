// marble_game_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marbleoooo/blocs/marble_game/mg_event.dart';
import 'package:marbleoooo/utils/uiUtils.dart';
import 'package:marbleoooo/widgets/board_widget.dart';
import '../blocs/marble_game/mg_bloc.dart';
import '../blocs/marble_game/mg_state.dart';
import '../models/player.dart';
import '../models/position.dart';
import '../utils/constants.dart';

class MarbleGameScreen extends StatefulWidget {
  @override
  State<MarbleGameScreen> createState() => _MarbleGameScreenState();
}

class _MarbleGameScreenState extends State<MarbleGameScreen> {
  int player1Wins = 0;
  int player2Wins = 0;
  @override
  Widget build(BuildContext context) {
    var width = SizeConfig.getWidth(context);
    var height = SizeConfig.getHeight(context);

    return BlocConsumer<MarbleGameBloc, MarbleGameState>(
      listener: (context, state) {
        if (state is Player1Won) {
          setState(() {
            player1Wins++;
          });
        } else if (state is Player2Won) {
          setState(() {
            player2Wins++;
          });
        }
        // TODO: implement listener
      },
      builder: (context, state) {
        return SafeArea(
          child: Stack(
            children: [
              Expanded(
                child: Image.asset('assets/background.jpg', fit: BoxFit.cover),
              ),
              Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                    backgroundColor: const Color.fromARGB(76, 255, 255, 255),
                    title: Text(
                        'Player 1 : $player1Wins     Player 2 : $player2Wins',
                        style: GoogleFonts.roboto(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w700,
                        ))),
                body: Column(
                  children: [
                    SizedBox(height: height * 0.2),
                    BoardWidget(
                      marbles: state.board,
                      onTap: (Position position) {
                        context.read<MarbleGameBloc>().add(
                              state.currentPlayer == Player.one
                                  ? Player1Move(position.row, position.col)
                                  : Player2Move(position.row, position.col),
                            );
                      },
                    ),
                    SizedBox(height: height * 0.2),
                    Row(
                      children: [
                        Container(
                            height: height * 0.08,
                            width: width * 0.35,
                            decoration: BoxDecoration(
                              color: state.currentPlayer == Player.one
                                  ? const Color.fromARGB(134, 255, 255, 255)
                                  : const Color.fromARGB(76, 255, 255, 255),
                              border: Border.all(
                                  color: state.currentPlayer == Player.one
                                      ? playerOneColor
                                      : Colors.white,
                                  width: 0.8),
                            ),
                            child: Text("Player 1",
                                style: GoogleFonts.roboto(
                                    fontSize: width * 0.04,
                                    fontWeight: FontWeight.w600,
                                    color: playerOneColor))),
                        Container(
                            height: height * 0.08,
                            width: width * 0.35,
                            decoration: BoxDecoration(
                              color: state.currentPlayer == Player.one
                                  ? const Color.fromARGB(134, 255, 255, 255)
                                  : const Color.fromARGB(76, 255, 255, 255),
                              border: Border.all(
                                  color: state.currentPlayer == Player.two
                                      ? playerTwoColor
                                      : Colors.white,
                                  width: 0.8),
                            ),
                            child: Text("Player 2",
                                style: GoogleFonts.roboto(
                                    fontSize: width * 0.04,
                                    fontWeight: FontWeight.w600,
                                    color: playerTwoColor))),
                      ],
                    ),
                    SizedBox(height: height * 0.08),
                    (state is Player1Won || state is Player2Won)
                        ? Container(
                            height: height * 0.08,
                            width: width * 0.6,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(76, 255, 255, 255),
                              border:
                                  Border.all(color: Colors.white, width: 0.8),
                            ),
                            child: Text("New Game ???",
                                style: GoogleFonts.roboto(
                                    fontSize: width * 0.04,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black)))
                        : const SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
