import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/dimens.dart';

class ToolIconButton extends StatefulWidget {
  const ToolIconButton({
    super.key, 
    required this.onPressed, 
    required this.icon, 
    this.message = "",
  });

  final void Function() onPressed;
  final Widget icon;
  final String message;

  @override
  State<ToolIconButton> createState() => _ToolIconButtonState();
}

class _ToolIconButtonState extends State<ToolIconButton> {  
  @override
  Widget build(BuildContext context) {
    return Container(
      // デザイン
      width: ToolUIDimens.width,
      height: ToolUIDimens.height,
      color: ToolUIColors.baseColor,

      child: Tooltip(
        message: widget.message,
        child: IconButton(
          // デザイン
          style: IconButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
              side: BorderSide(
                color: ToolUIColors.borderColor, // ここで色を指定
                width: ToolUIDimens.borderWidth, // 線の太さも指定可能
              ),
            ),
          ),
          // イベント
          onPressed: widget.onPressed, 
          // ウィジェット
          icon: widget.icon,
        ),
      ),
    );
  }
}