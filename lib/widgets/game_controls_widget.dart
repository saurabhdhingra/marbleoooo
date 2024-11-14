import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/marble_game/mg_bloc.dart';
import '../blocs/marble_game/mg_event.dart';

class GameControlsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () =>
              context.read<MarbleGameBloc>().add(RotateBoardEvent()),
          child: Text("Rotate Board"),
        ),
        // Additional controls can be added here
      ],
    );
  }
}
