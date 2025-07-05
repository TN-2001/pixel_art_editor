import 'package:flutter/material.dart';
import '/constants/colors.dart';
import 'color_picker_canvas.dart';

class AlphaSlider extends StatelessWidget {
  const AlphaSlider({
    super.key,
    required this.width,
    this.height = 50,
    required this.hue,
    required this.saturation, 
    required this.value,
    required this.alpha,
    required this.onChanged,
  });

  final double width;
  final double height;
  final double hue;
  final double saturation;
  final double value;
  final double alpha;
  final void Function(double newAlpha) onChanged;

  void _onAlphaTap(Offset offset, Size size) {
    final x = offset.dx.clamp(0.0, size.width);
    onChanged(x / size.width);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Row(
        children: [
          SizedBox(
            width: 10,
            child: Text("A"),
          ),

          SizedBox(width: 10,),

          Container(
            width: width - 10 - 50 - 20,
            height: height,
            decoration: BoxDecoration(
              border: Border.all(color: BaseColors.borderColor),
            ),

            child: GestureDetector(
              onPanDown: (d) => _onAlphaTap(d.localPosition, Size(width - 10 - 50 - 20, height)),
              onPanUpdate: (d) => _onAlphaTap(d.localPosition, Size(width - 10 - 50 - 20, height)),
              child: CustomPaint(
                painter:_AlphaPainter(hue, saturation, value, alpha),
              ),
            ),
          ),

          SizedBox(width: 10,),

          SizedBox(
            width: 50,
            height: height,
            child: TextField(
              
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AlphaPainter extends CustomPainter {
  _AlphaPainter(this.hue, this.saturation, this.value, this.alpha);

  final double hue;
  final double saturation;
  final double value;
  final double alpha;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final baseColor = HSVColor.fromAHSV(1, hue, saturation, value).toColor();

    final whiteGradient = Paint()
      ..shader = LinearGradient(
        colors: [const Color.fromARGB(0, 255, 255, 255), baseColor],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ).createShader(rect);

    canvas.drawRect(rect, whiteGradient);

    // 選択中の位置を表示
    ColorPickerCanvas.drawCursor(canvas, size, Offset(alpha * size.width, size.height / 2));
  }

  @override
  bool shouldRepaint(covariant _AlphaPainter oldDelegate) {
    return oldDelegate.hue != hue ||
        oldDelegate.saturation != saturation ||
        oldDelegate.value != value ||
        oldDelegate.alpha != alpha;
  }
}