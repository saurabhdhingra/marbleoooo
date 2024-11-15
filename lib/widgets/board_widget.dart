import 'package:flutter/material.dart';
import 'package:marbleoooo/models/position.dart';
import 'package:marbleoooo/utils/ui_utils.dart';
import 'package:marbleoooo/widgets/marble.dart';
import '../utils/constants.dart';
import '../models/player.dart';

class BoardWidget extends StatefulWidget {
  final List<List<Player?>> marbles;
  final Function(Position) onTap;

  const BoardWidget({
    super.key,
    required this.marbles,
    required this.onTap,
  });

  @override
  State<BoardWidget> createState() => _BoardWidgetState();
}

class _BoardWidgetState extends State<BoardWidget> {
  @override
  Widget build(BuildContext context) {
    var width = SizeConfig.getWidth(context);
    return Container(
      height: width,
      width: width,
      padding: EdgeInsets.all(width * 0.05),
      child: Column(
        children: [
          _buildRow(0, width),
          buildRowDivider(width),
          _buildRow(1, width),
          buildRowDivider(width),
          _buildRow(2, width),
          buildRowDivider(width),
          _buildRow(3, width),
        ],
      ),
    );
  }

  Row _buildRow(int index, double width) {
    Radius radiusOne = Radius.circular(width * 0.01);

    return Row(
      children: List.generate(
        7,
        (i) {
          if (i % 2 == 0) {
            return _buildCell(
                widget.marbles[index][i ~/ 2], width, Position(index, i ~/ 2));
          } else {
            return buildColDivider(width, index, radiusOne);
          }
        },
      ),
    );
  }

  Container buildColDivider(double width, int index, Radius radiusOne) {
    return Container(
      height: width * 0.21,
      width: width * 0.02,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: index == 0 ? radiusOne : Radius.zero,
          topRight: index == 0 ? radiusOne : Radius.zero,
          bottomLeft: index == 3 ? radiusOne : Radius.zero,
          bottomRight: index == 3 ? radiusOne : Radius.zero,
        ),
      ),
    );
  }

  Container buildRowDivider(double width) {
    return Container(
      height: width * 0.02,
      width: width * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(width * 0.01),
      ),
    );
  }

  Container _buildCell(Player? player, double width, Position position) {
    return Container(
      padding: EdgeInsets.all(width * 0.03),
      color: Colors.transparent,
      width: width * 0.21,
      height: width * 0.21,
      child: player != null
          ? Center(
              child: MarbleWidget(
                size: width * 0.18,
                baseColor:
                    player == Player.one ? playerOneColor : playerTwoColor,
              ),
            )
          : GestureDetector(
              onTap: () {
                widget.onTap(position);
                print(position.row);
                print(position.col);
              },
              child: SizedBox(
                width: width * 0.21,
                height: width * 0.21,
              ),
            ),
    );
  }
}
