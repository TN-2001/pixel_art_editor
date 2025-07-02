import 'package:flutter/material.dart';
import '../models/pixel_canvas_controller.dart';

class ControlButtons extends StatelessWidget {
  const ControlButtons({super.key, required this.controller});
  
  final PixelCanvasController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(onPressed: controller.undo, child: Text("Undo")),
        SizedBox(width: 8),
        ElevatedButton(onPressed: controller.redo, child: Text("Redo")),
        SizedBox(width: 8),
        ElevatedButton(onPressed: controller.clear, child: Text("Clear")),
      ],
    );
  }
}
