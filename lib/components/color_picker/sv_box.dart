import 'package:flutter/material.dart';
import 'color_picker_canvas.dart';

class SVBox extends StatelessWidget {
  const SVBox({
    super.key, 
    required this.size,
    required this.hue,
    required this.saturation, 
    required this.value,
    required this.onChanged,
  });

  final double size;
  final double hue;
  final double saturation;
  final double value;
  final void Function(double newSaturation, double newValue) onChanged;

  void _onSVTap(Offset offset, Size size) {
    final x = offset.dx.clamp(0.0, size.width);
    final y = offset.dy.clamp(0.0, size.height);
    onChanged(x / size.width, 1.0 - y / size.height);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: GestureDetector(
        onPanDown: (d) => _onSVTap(d.localPosition, Size(size, size)),
        onPanUpdate: (d) => _onSVTap(d.localPosition, Size(size, size)),
        child: CustomPaint(
          painter: _SVBoxPainter(hue, saturation, value),
        ),
      ),
    );
  }
}

class _SVBoxPainter extends CustomPainter {
  _SVBoxPainter(this.hue, this.saturation, this.value);

  final double hue;
  final double saturation;
  final double value;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final baseColor = HSVColor.fromAHSV(1, hue, 1, 1).toColor();

    final whiteGradient = Paint()
      ..shader = LinearGradient(
        colors: [Colors.white, baseColor],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ).createShader(rect);

    canvas.drawRect(rect, whiteGradient);

    final blackGradient = Paint()
      ..shader = LinearGradient(
        colors: [Colors.transparent, Colors.black],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(rect)
      ..blendMode = BlendMode.multiply;

    canvas.drawRect(rect, blackGradient);

    // 選択中の位置を表示
    ColorPickerCanvas.drawCursor(canvas, size, Offset(saturation * size.width, (1.0 - value) * size.height));
  }

  @override
  bool shouldRepaint(covariant _SVBoxPainter oldDelegate) {
    return oldDelegate.hue != hue ||
        oldDelegate.saturation != saturation ||
        oldDelegate.value != value;
  }
}
