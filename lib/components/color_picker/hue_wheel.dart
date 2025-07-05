import 'dart:math';
import 'package:flutter/material.dart';
import 'color_picker_canvas.dart';

class HueWheel extends StatelessWidget {
  const HueWheel({
    super.key, 
    required this.size,
    required this.hue,
    required this.onChanged,
  });

  final double size;
  final double hue;
  final void Function(double newHue) onChanged;


  void _onHueTap(Offset offset, Size size) {
    final center = size.center(Offset.zero);
    final dx = offset.dx - center.dx;
    final dy = offset.dy - center.dy;
    final distance = sqrt(dx * dx + dy * dy);
    final outerRadius = size.width / 2;
    final innerRadius = outerRadius * 0.75;
    if (distance < innerRadius || distance > outerRadius) return;

    double angle = atan2(dy, dx);
    if (angle < 0) {
      angle += 2 * pi;
    }
    onChanged(360 - (angle * 180 / pi));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: GestureDetector(
        onPanDown: (d) => _onHueTap(d.localPosition, Size(size, size)),
        onPanUpdate: (d) => _onHueTap(d.localPosition, Size(size, size)),
        child: CustomPaint(
          size: Size(size, size),
          painter: _HueWheelPainter(hue: hue),
        ),
      ),
    );
  }
}


class _HueWheelPainter extends CustomPainter {
  _HueWheelPainter({required this.hue});

  final double hue; // 360度

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = size.center(Offset.zero); // 中心座標
    final double radius = size.width / 2; // 半径
    final double strokeWidth = radius * 0.2; // ホールの幅

    final rect = Rect.fromCircle(center: center, radius: radius - strokeWidth / 2);
    final gradient = SweepGradient(
      colors: List.generate(361, (i) => HSVColor.fromAHSV(1, 360 - i.toDouble(), 1, 1).toColor()),
    );

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(center, radius - strokeWidth / 2, paint);

    // 選択中のhueインジケータを描画
    final angle = (360 - hue) * pi / 180;
    final indicatorRadius = radius - strokeWidth / 2;
    final indicatorOffset = Offset(
      center.dx + indicatorRadius * cos(angle),
      center.dy + indicatorRadius * sin(angle),
    );
    ColorPickerCanvas.drawCursor(canvas, size, indicatorOffset);
  }

  @override
  bool shouldRepaint(covariant _HueWheelPainter oldDelegate) => oldDelegate.hue != hue;
}

