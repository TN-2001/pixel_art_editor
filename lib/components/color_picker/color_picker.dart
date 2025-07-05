import 'package:flutter/material.dart';
import 'package:pixel_art_editor/components/color_picker/alpha_slider.dart';
import 'hue_wheel.dart';
import 'sv_box.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({
    super.key, 
    this.width = 250,
    required this.onColorChanged, 
  });

  final double width;
  final ValueChanged<Color> onColorChanged;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  double hue = 0;
  double saturation = 1.0;
  double value = 1.0;
  double alpha = 1.0;

  void _updateColor() {
    final color = HSVColor.fromAHSV(alpha, hue, saturation, value).toColor();
    widget.onColorChanged(color);
  }

  @override
  void initState() {
    super.initState();
    _updateColor();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: widget.width,
          height: widget.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              HueWheel(
                size: widget.width,
                hue: hue, 
                onChanged: (newHue) {
                  setState(() {
                    hue = newHue;
                  });
                  _updateColor();
                },
              ),
              SVBox(
                size: widget.width * 0.5, 
                hue: hue, 
                saturation: saturation, 
                value: value, 
                onChanged: (newSaturation, newValue) {
                  setState(() {
                    saturation = newSaturation;
                    value = newValue;
                  });
                  _updateColor();
                }
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        AlphaSlider(
          width: widget.width, 
          hue: hue, saturation: saturation, value: value, alpha: alpha, 
          onChanged: (newAlpha) {
            setState(() {
              alpha = newAlpha;
            });
            _updateColor();
          },
        ),
      ],
    );
  }
}
