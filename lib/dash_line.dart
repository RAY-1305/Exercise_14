// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class DashLine extends StatelessWidget {
  final int numOfLines;
  const DashLine({super.key, required this.numOfLines});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width - 8;
    final double maxWidth = screenWidth / numOfLines;
    final List<LinePainter> dashLine = [];

    for (int i = 0; i < numOfLines; i++) {
      dashLine.add(LinePainter(width: maxWidth, index: i));
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        children: dashLine,
      ),
    );
  }
}

class LinePainter extends StatelessWidget {
  final double width;
  final int index;
  const LinePainter({super.key, required this.width, required this.index});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: Painter(width, index),
      child: Container(),
    );
  }
}

class Painter extends CustomPainter {
  final double width;
  final int index;

  Painter(this.width, this.index);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = (index % 2 == 0) ? Colors.black : Colors.white;
    paint.strokeWidth = 2;

    Offset p1 = Offset(index * width, 100);
    Offset p2 = Offset(p1.dx + width, 100);
    canvas.drawLine(p1, p2, paint);
    print("index: $index");
    print("width: ${p2.dx - p1.dx}");
    print('--------');
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
