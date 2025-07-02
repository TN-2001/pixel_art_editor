import 'package:flutter/material.dart';

class PixelCanvasController extends ChangeNotifier {
  int gridWidth = 16;
  int gridHeight = 16;
  Color selectedColor = Colors.black;
  late List<Color> pixelColors;
  final List<List<Color>> undoStack = [];
  final List<List<Color>> redoStack = [];

  final TextEditingController widthController = TextEditingController(text: '16');
  final TextEditingController heightController = TextEditingController(text: '16');

  PixelCanvasController() {
    _initCanvas();
  }

  void _initCanvas() {
    pixelColors = List.generate(gridWidth * gridHeight, (_) => Colors.white);
    undoStack.clear();
    redoStack.clear();
    notifyListeners();
  }

  void saveToUndo() {
    undoStack.add(List<Color>.from(pixelColors));
    redoStack.clear();
  }

  void undo() {
    if (undoStack.isNotEmpty) {
      redoStack.add(List<Color>.from(pixelColors));
      pixelColors = undoStack.removeLast();
      notifyListeners();
    }
  }

  void redo() {
    if (redoStack.isNotEmpty) {
      undoStack.add(List<Color>.from(pixelColors));
      pixelColors = redoStack.removeLast();
      notifyListeners();
    }
  }

  void clear() {
    saveToUndo();
    pixelColors = List.generate(gridWidth * gridHeight, (_) => Colors.white);
    notifyListeners();
  }

  void resizeCanvas() {
    final newW = int.tryParse(widthController.text);
    final newH = int.tryParse(heightController.text);
    if (newW != null && newW > 0 && newH != null && newH > 0) {
      gridWidth = newW;
      gridHeight = newH;
      _initCanvas();
    }
  }

  void setSelectedColor(Color color) {
    selectedColor = color;
    notifyListeners();
  }

  void paintPixel(Offset localPos, Size size) {
    final cellWidth = size.width / gridWidth;
    final cellHeight = size.height / gridHeight;

    final x = (localPos.dx ~/ cellWidth).clamp(0, gridWidth - 1);
    final y = (localPos.dy ~/ cellHeight).clamp(0, gridHeight - 1);
    final index = y * gridWidth + x;

    if (pixelColors[index] != selectedColor) {
      pixelColors[index] = selectedColor;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    widthController.dispose();
    heightController.dispose();
    super.dispose();
  }
}
