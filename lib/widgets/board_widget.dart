import 'package:flutter/material.dart';
import 'cell_widget.dart';
import '../models/player.dart';

class BoardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemBuilder: (context, index) {
        int row = index ~/ 4;
        int col = index % 4;
        return CellWidget(row: row, col: col);
      },
      itemCount: 16,
    );
  }
}
