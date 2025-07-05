import 'package:flutter/material.dart';
import 'package:pixel_art_editor/constants/colors.dart';
import '../../components/color_picker/color_picker.dart';
import '../models/pixel_canvas_controller.dart';

class ColorPalette extends StatefulWidget {
  const ColorPalette({super.key, required this.controller});

  final PixelCanvasController controller;

  @override
  State<ColorPalette> createState() => _ColorPaletteState();
}

class _ColorPaletteState extends State<ColorPalette> {

  void onColorChanged(Color color) {
    widget.controller.selectedColor = color;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BaseColors.baseColor,
      child: Column(
        children: [
          ColorPicker(
            onColorChanged: onColorChanged,
            width: 200,
          ),
        ],
      ),
    );
  }
}
