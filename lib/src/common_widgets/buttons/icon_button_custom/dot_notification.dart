import 'package:flutter/material.dart';

import 'package:master_source_flutter/src/common_widgets/buttons/icon_button_custom/icon_button_custom.dart';

class DotNotification extends StatelessWidget {
  final double sizeButton;
  final double borderWidthButton;
  final double shadowWidthButton;
  final AnimationController buttonAnimationController;

  const DotNotification({
    super.key,
    required this.sizeButton,
    required this.borderWidthButton,
    required this.shadowWidthButton,
    required this.buttonAnimationController,
  });

  @override
  Widget build(BuildContext context) {
    return PositionedTransition(
      rect: RelativeRectTween(
        begin: RelativeRect.fromSize(
          Rect.fromLTWH(
              sizeButton +
                  borderWidthButton * 2 -
                  IconButtonCustom.iconSizeDot +
                  2,
              -2,
              IconButtonCustom.iconSizeDot,
              IconButtonCustom.iconSizeDot),
          Size(
            sizeButton + borderWidthButton * 2,
            sizeButton + borderWidthButton * 2 + shadowWidthButton,
          ),
        ),
        end: RelativeRect.fromSize(
          Rect.fromLTWH(
              sizeButton +
                  borderWidthButton * 2 -
                  IconButtonCustom.iconSizeDot +
                  2,
              -2 + shadowWidthButton,
              IconButtonCustom.iconSizeDot,
              IconButtonCustom.iconSizeDot),
          Size(
            sizeButton + borderWidthButton * 2,
            sizeButton + borderWidthButton * 2 + shadowWidthButton,
          ),
        ),
      ).animate(buttonAnimationController),
      child: Container(
        width: IconButtonCustom.iconSizeDot,
        height: IconButtonCustom.iconSizeDot,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: IconButtonCustom.iconBorderDot,
          ),
          borderRadius: BorderRadius.circular(100),
          color: const Color.fromRGBO(235, 59, 91, 1),
        ),
      ),
    );
  }
}
