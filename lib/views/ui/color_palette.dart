import 'package:flutter/material.dart';
import '../models/pixel_canvas_controller.dart';

class ColorPalette extends StatelessWidget {
  ColorPalette({super.key, required this.controller});

  final PixelCanvasController controller;

  final List<Color> colors = [
    Colors.black,
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: colors.map((color) {
        return GestureDetector(
          onTap: () => controller.setSelectedColor(color),
          child: Container(
            width: 32,
            height: 32,
            margin: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: color,
              border: Border.all(
                color: controller.selectedColor == color ? Colors.white : Colors.black,
                width: 2,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
