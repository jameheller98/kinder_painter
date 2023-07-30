import 'package:flutter/material.dart';

import 'package:master_source_flutter/src/constants/theme.dart';
import 'package:master_source_flutter/src/constants/theme_model.dart';
import 'package:master_source_flutter/src/common_widgets/buttons/icon_button_custom/dot_notification.dart';
import 'package:master_source_flutter/src/common_widgets/buttons/icon_button_custom/icon_button_content.dart';

class IconButtonCustom extends StatefulWidget {
  static const double iconBorderDot = 1;
  static const double iconSizeDot = 8 + iconBorderDot * 2;

  final void Function() onPress;
  final ThemeNameButtonIcon themeName;
  final String svgPictureUrl;
  final bool isNotification;
  final double size;
  final Map<String, double> border;
  final double shadowWidth;
  final double sizeIcon;

  IconButtonCustom({
    super.key,
    required this.onPress,
    required this.themeName,
    required this.svgPictureUrl,
    bool? isNotification,
    double? size,
    Map<String, double>? border,
    double? shadowWidth,
    double? sizeIcon,
  })  : isNotification = isNotification ?? false,
        size = size ?? 25,
        border = border ?? {'width': 2, 'radius': 10},
        shadowWidth = shadowWidth ?? 1,
        sizeIcon = sizeIcon ?? 15;

  @override
  State<IconButtonCustom> createState() => _IconButtonCustomState();
}

class _IconButtonCustomState extends State<IconButtonCustom>
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
    return SizedBox(
      width: widget.size + widget.border['width']! * 2,
      height: widget.size + widget.border['width']! * 2 + widget.shadowWidth,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          IconButtonContent(
              sizeButton: widget.size,
              sizeButtonIcon: widget.sizeIcon,
              borderWidthButton: widget.border['width']!,
              borderRadiusButton: widget.border['radius']!,
              shadowWidthButton: widget.shadowWidth,
              shadowColor: themeButtonIcon[widget.themeName]!.shadowColor,
              backgroundColor:
                  themeButtonIcon[widget.themeName]!.backgroundColor,
              onPress: widget.onPress,
              buttonAnimationController: _buttonAnimationController,
              svgPictureUrl: widget.svgPictureUrl),
          if (widget.isNotification)
            DotNotification(
                sizeButton: widget.size,
                borderWidthButton: widget.border['width']!,
                shadowWidthButton: widget.shadowWidth,
                buttonAnimationController: _buttonAnimationController)
        ],
      ),
    );
  }

  @override
  void dispose() {
    _buttonAnimationController.dispose();

    super.dispose();
  }
}
