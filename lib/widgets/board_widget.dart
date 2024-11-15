import 'package:flutter/material.dart';
import 'package:marbleoooo/models/position.dart';
import 'package:marbleoooo/utils/uiUtils.dart';
import 'package:marbleoooo/widgets/marble.dart';
import '../utils/constants.dart';
import 'cell_widget.dart';
import '../models/player.dart';

class BoardWidget extends StatelessWidget {
  final List<List<Player?>> marbles;
  final Function(Position) onTap;

  const BoardWidget({
    super.key,
    required this.marbles,
    required this.onTap,
  });

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
                marbles[index][i], width, Position(index, (i / 2) as int));
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
              onTap: onTap(position),
              child: SizedBox(
                width: width * 0.21,
                height: width * 0.21,
              ),
            ),
    );
  }
}
