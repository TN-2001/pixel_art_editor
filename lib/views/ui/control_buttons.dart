import 'package:flutter/material.dart';
import 'package:pixel_art_editor/components/tool_bar_divider.dart';
import 'package:pixel_art_editor/components/tool_icon_button.dart';
import 'package:pixel_art_editor/components/tool_toggle_buttons.dart';
import 'package:pixel_art_editor/constants/colors.dart';
import 'package:pixel_art_editor/constants/paths.dart';
import '../models/pixel_canvas_controller.dart';

class ControlButtons extends StatelessWidget {
  const ControlButtons({super.key, required this.controller});
  
  final PixelCanvasController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ToolBarColors.baseColor,
      child: Row(
        children: [
          ToolIconButton(
            message: "メニュー", 
            onPressed: (){},
            icon: Icon(Icons.menu), 
          ),

          ToolBarDivider(isVertivcal: true,),

          ToolIconButton(
            onPressed: controller.undo,
            icon: Icon(Icons.undo), 
            message: "戻る", 
          ),
          ToolIconButton(
            onPressed: controller.redo,
            icon: Icon(Icons.redo), 
            message: "進む", 
          ),
          ToolIconButton(
            onPressed: controller.clear,
            icon: Icon(Icons.clear), 
            message: "クリア", 
          ),

          ToolBarDivider(isVertivcal: true,),

          ToolToggleButtons(
            onPressed: (value){},
            icons: [
              Icon(Icons.brush),
              ImageIcon(AssetImage(ImagePass.iconEraser)),
            ], 
            messages: [
              "筆",
              "消しゴム",
            ],
          ),
          
          ToolBarDivider(isVertivcal: true,),
        ],
      ),
    );
  }
}
