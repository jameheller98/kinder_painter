import 'package:flutter/material.dart';

import 'package:master_source_flutter/src/constants/theme.dart';
import 'package:master_source_flutter/src/constants/theme_model.dart';
import 'package:master_source_flutter/src/common_widgets/buttons/text_button_custom/text_button_content.dart';

class TextButtonCustom extends StatefulWidget {
  final void Function() onPress;
  final ThemeNameButtonText themeName;
  final double width;
  final double height;
  final Map<String, double> border;
  final double layerWidth;
  final Map<String, double> text;
  final String title;
  final bool disabled;
  final bool isShadow;

  TextButtonCustom({
    super.key,
    required this.onPress,
    required this.themeName,
    required this.title,
    double? width,
    double? height,
    Map<String, double>? border,
    double? layerWidth,
    Map<String, double>? text,
    bool? disabled,
    bool? isShadow,
  })  : width = width ?? 80,
        height = height ?? 22.4,
        border = border ?? {'width': 2, 'radius': 100},
        layerWidth = layerWidth ?? 2.6,
        text = text ?? {'lineHeight': 16, 'fontSize': 12},
        disabled = disabled ?? false,
        isShadow = isShadow ?? false;

  @override
  State<TextButtonCustom> createState() => _TextButtonCustomState();
}

class _TextButtonCustomState extends State<TextButtonCustom>
    with SingleTickerProviderStateMixin {
  late AnimationController _buttonAnimationController;

  @override
  void initState() {
    super.initState();

    _buttonAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
      lowerBound: 0,
      upperBound: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _buttonAnimationController,
      builder: (ctx, child) => Transform.translate(
        offset: Offset(0, _buttonAnimationController.value * widget.layerWidth),
        child: Container(
          height: widget.height +
              widget.layerWidth +
              widget.border['width']! * 2 -
              _buttonAnimationController.value * widget.layerWidth,
          width: widget.width + widget.border['width']! * 2,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: widget.border['width']!,
            ),
            borderRadius: BorderRadius.circular(widget.border['radius']!),
            boxShadow: widget.isShadow
                ? const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.25),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: TextButtonContent(
            borderRadius: widget.border['radius']!,
            height: widget.height,
            width: widget.width,
            layerWidth: widget.layerWidth,
            layerColor: themeButtonText[widget.themeName]!.layerColor,
            animationController: _buttonAnimationController,
            backgroundColor: themeButtonText[widget.themeName]!.backgroundColor,
            backgroundSubColor:
                themeButtonText[widget.themeName]!.backgroundSubColor,
            onPress: widget.onPress,
            title: widget.title,
            lineHeight: widget.text['lineHeight']!,
            fontSize: widget.text['fontSize']!,
            disabled: widget.disabled,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _buttonAnimationController.dispose();

    super.dispose();
  }
}
