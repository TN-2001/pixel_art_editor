import 'package:flutter/material.dart';
import '../models/pixel_canvas_controller.dart';

class SizeInputArea extends StatelessWidget {
  const SizeInputArea({super.key, required this.controller});
  
  final PixelCanvasController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 70,
            child: TextField(
              controller: controller.widthController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Width'),
            ),
          ),
          SizedBox(width: 8),
          SizedBox(
            width: 70,
            child: TextField(
              controller: controller.heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Height'),
            ),
          ),
          SizedBox(width: 12),
          ElevatedButton(onPressed: controller.resizeCanvas, child: Text('Resize')),
        ],
      ),
    );
  }
}
