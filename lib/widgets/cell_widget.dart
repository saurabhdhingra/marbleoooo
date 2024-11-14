import 'package:flutter/material.dart';

class CellWidget extends StatelessWidget {
  final int row;
  final int col;

  CellWidget({required this.row, required this.col});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Add cell tap interaction here
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        child: Center(
          child: Text(""),
        ),
      ),
    );
  }
}
