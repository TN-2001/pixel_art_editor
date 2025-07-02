import 'package:flutter/material.dart';
import 'package:pixel_art_editor/views/editor_page.dart';

void main() => runApp(PixelArtEditor());

class PixelArtEditor extends StatelessWidget {
  const PixelArtEditor({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: EditorPage());
  }
}
