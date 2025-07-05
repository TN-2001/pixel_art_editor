import 'package:flutter/material.dart';

class ColorPickerCanvas {
  static void drawCursor(Canvas canvas, Size size, Offset position) {
    canvas.drawCircle(position, 6, Paint()
      ..color = const Color.fromARGB(255, 194, 194, 194)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3);
    canvas.drawCircle(position, 6, Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2);
  }
}