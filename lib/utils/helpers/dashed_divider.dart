import 'package:flutter/material.dart';

class DashedDivider extends StatelessWidget {
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashGap;
  final double height;

  const DashedDivider({
    super.key,
    this.color = Colors.black,
    this.strokeWidth = 1.0,
    this.dashWidth = 5.0,
    this.dashGap = 5.0,
    this.height = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashCount = (boxWidth / (dashWidth + dashGap) + 1).floor();

        return CustomPaint(
          painter: DashedDividerPainter(
            color: color,
            strokeWidth: strokeWidth,
            dashWidth: dashWidth,
            dashGap: dashGap,
            dashCount: dashCount,
          ),
          child: SizedBox(
            height: height,
            width: boxWidth,
          ),
        );
      },
    );
  }
}

class DashedDividerPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashGap;
  final int dashCount;

  DashedDividerPainter({
    this.color = Colors.black,
    this.strokeWidth = 1.0,
    this.dashWidth = 5.0,
    this.dashGap = 5.0,
    required this.dashCount,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    double startX = 0;
    for (int i = 0; i < dashCount; i++) {
      canvas.drawLine(
        Offset(startX, size.height / 2),
        Offset(startX + dashWidth, size.height / 2),
        paint,
      );
      startX += dashWidth + dashGap;
    }
  }

  @override
  bool shouldRepaint(DashedDividerPainter oldDelegate) => false;
}
