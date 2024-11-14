// marble_game_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/marble_game/mg_bloc.dart';

class MarbleGameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MarbleGameBloc(),
      child: Scaffold(
        appBar: AppBar(title: Text('Marble Game')),
        body: Column(
          children: [
            Expanded(child: _buildGameBoard()),
            _buildControlPanel(),
          ],
        ),
      ),
    );
  }

  Widget _buildGameBoard() {
    return BlocBuilder<MarbleGameBloc, MarbleGameState>(
      builder: (context, state) {
        return GridView.builder(
          itemCount: 16,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemBuilder: (context, index) {
            final row = index ~/ 4;
            final col = index % 4;
            final player = state.board[row][col];
            return GestureDetector(
              onTap: () {
                context.read<MarbleGameBloc>().add(PlaceMarbleEvent(row, col));
              },
              child: Container(
                margin: EdgeInsets.all(4.0),
                color: player == Player.none
                    ? Colors.grey[300]
                    : (player == Player.player1 ? Colors.blue : Colors.red),
                child: Center(
                  child: Text(
                    player == Player.none
                        ? ''
                        : (player == Player.player1 ? 'X' : 'O'),
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildControlPanel() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              context.read<MarbleGameBloc>().add(RotateBoardEvent());
            },
            child: Text('Rotate Board'),
          ),
        ],
      ),
    );
  }
}
