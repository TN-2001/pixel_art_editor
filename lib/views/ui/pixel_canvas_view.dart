import 'package:flutter/material.dart';
import '../models/pixel_canvas_controller.dart';
import 'color_palette.dart';
import 'size_input_area.dart';
import 'control_buttons.dart';
import 'pixel_paint_area.dart';

class PixelCanvasView extends StatefulWidget {
  const PixelCanvasView({super.key, required this.controller});
  
  final PixelCanvasController controller;

  @override
  State<PixelCanvasView> createState() => _PixelCanvasViewState();
}

class _PixelCanvasViewState extends State<PixelCanvasView> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_update);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_update);
    super.dispose();
  }

  void _update() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final controller = widget.controller;

    return Scaffold(
      appBar: AppBar(title: Text("ドット絵エディタ")),
      body: Column(
        children: [
          ColorPalette(controller: controller),
          SizeInputArea(controller: controller),
          ControlButtons(controller: controller),
          Expanded(child: PixelPaintArea(controller: controller)),
        ],
      ),
    );
  }
}
