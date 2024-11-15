import 'package:flutter/material.dart';

class MarbleWidget extends StatelessWidget {
  final Color baseColor;
  final double size;

  const MarbleWidget({
    Key? key,
    this.baseColor = Colors.blue,
    this.size = 50.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: MarblePainter(baseColor),
      ),
    );
  }
}

class MarblePainter extends CustomPainter {
  final Color baseColor;

  MarblePainter(this.baseColor);

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;

    // Draw the base gradient for the marble
    final gradientPaint = Paint()
      ..shader = RadialGradient(
        colors: [
          baseColor.withOpacity(0.8),
          baseColor,
          baseColor.withOpacity(0.4),
        ],
        stops: [0.3, 0.6, 1.0],
      ).createShader(Rect.fromCircle(center: Offset(radius, radius), radius: radius));

    canvas.drawCircle(Offset(radius, radius), radius, gradientPaint);

    // Add a highlight to mimic a light reflection
    final highlightPaint = Paint()
      ..shader = RadialGradient(
        colors: [
          Colors.white.withOpacity(0.8),
          Colors.white.withOpacity(0.0),
        ],
        stops: [0.0, 0.7],
      ).createShader(Rect.fromCircle(center: Offset(radius * 0.6, radius * 0.6), radius: radius * 0.4));

    canvas.drawCircle(Offset(radius * 0.6, radius * 0.6), radius * 0.4, highlightPaint);

    // Add a subtle shadow on the bottom to enhance the spherical look
    final shadowPaint = Paint()
      ..shader = RadialGradient(
        colors: [
          Colors.black.withOpacity(0.3),
          Colors.transparent,
        ],
        stops: [0.0, 1.0],
      ).createShader(Rect.fromCircle(center: Offset(radius * 1.3, radius * 1.3), radius: radius * 0.5));

    canvas.drawCircle(Offset(radius * 1.3, radius * 1.3), radius * 0.5, shadowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
