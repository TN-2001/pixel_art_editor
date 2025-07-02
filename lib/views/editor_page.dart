import 'package:flutter/material.dart';
import 'models/pixel_canvas_controller.dart';
import 'ui/pixel_canvas_view.dart';

class EditorPage extends StatefulWidget {
  const EditorPage({super.key});

  @override
  State<EditorPage> createState() => _EditorPageState();
}

class _EditorPageState extends State<EditorPage> {
  late final PixelCanvasController controller;

  @override
  void initState() {
    super.initState();
    controller = PixelCanvasController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PixelCanvasView(controller: controller);
  }
}
