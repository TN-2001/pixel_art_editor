import 'package:flutter/material.dart';
import 'package:pixel_art_editor/components/base_divider.dart';
import 'package:pixel_art_editor/views/ui/color_palette.dart';
import 'models/pixel_canvas_controller.dart';
import 'ui/tool_bar.dart';
import 'ui/pixel_paint_area.dart';

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
    controller.addListener(_update);
  }

  @override
  void dispose() {
    controller.removeListener(_update);
    controller.dispose();
    super.dispose();
  }

  void _update() => setState(() {});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          ToolBar(controller: controller),
          BaseDivider(),
          Expanded(
            child: Row(
              children: [
                ColorPalette(controller: controller),
                BaseDivider(isVertivcal: true,),
                Expanded(
                  child: PixelPaintArea(controller: controller),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
