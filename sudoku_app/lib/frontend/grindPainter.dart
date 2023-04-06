import 'dart:math';

import 'package:flutter/material.dart';

class GridPainter extends CustomPainter {
  final List<Point> boxesToOutline;
  final double boxSize;
  final Color lineColor;
  final double lineWidth;

  GridPainter(
      {required this.boxesToOutline,
      this.boxSize = 65.0,
      this.lineColor = Colors.red,
      this.lineWidth = 1.0});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = lineColor
      ..strokeWidth = lineWidth
      ..style = PaintingStyle.stroke;

    var largestX = boxesToOutline.reduce((v, e) => v.x >= e.x ? v : e).x;
    var largestY = boxesToOutline.reduce((v, e) => v.y >= e.y ? v : e).y;
    var smallestX = boxesToOutline.reduce((v, e) => v.x <= e.x ? v : e).x;
    var smallestY = boxesToOutline.reduce((v, e) => v.y <= e.y ? v : e).y;

    for (var box in boxesToOutline) {
      double x = box.x * boxSize;
      double y = box.y * boxSize;

      if (box.x == smallestX && box.y == smallestY) {
        // Draw top left corner line
        canvas.drawLine(Offset(x, y), Offset(x + boxSize, y), paint);
        canvas.drawLine(Offset(x, y), Offset(x, y + boxSize), paint);
      }

      if (box.x > smallestX && box.y == smallestY) {
        canvas.drawLine(Offset(x, y), Offset(x + boxSize, y), paint);
      }

      // if (box.x == 1 && box.y == smallestY) {
      //   // Draw top right corner line
      //   canvas.drawLine(
      //       Offset(x + boxSize, y), Offset(x + boxSize, y + boxSize), paint);
      //   canvas.drawLine(Offset(x, y), Offset(x + boxSize, y), paint);
      // }

      if (box.x == largestX && box.y > smallestY) {
        canvas.drawLine(Offset(x, y), Offset(x + boxSize, y), paint);
      }

      // if (box.x == 2 && box.y == smallestY) {
      //   // Draw bottom right corner line
      //   canvas.drawLine(
      //       Offset(x + boxSize, y), Offset(x + boxSize, y + boxSize), paint);
      //   canvas.drawLine(
      //       Offset(x + boxSize, y + boxSize), Offset(x, y + boxSize), paint);
      // }

      // if (box.x == 2 && box.y == 1) {
      //   // Draw bottom left corner line
      //   canvas.drawLine(
      //       Offset(x, y + boxSize), Offset(x + boxSize, y + boxSize), paint);
      //   canvas.drawLine(Offset(x, y), Offset(x, y + boxSize), paint);
      // }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
