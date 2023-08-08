import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconButtonContent extends StatelessWidget {
  final double sizeButton;
  final double sizeButtonIcon;
  final double borderWidthButton;
  final double borderRadiusButton;
  final Color shadowColor;
  final double shadowWidthButton;
  final Color backgroundColor;
  final void Function()? onPress;
  final AnimationController buttonAnimationController;
  final String svgPictureUrl;
  final bool disabled;

  const IconButtonContent({
    super.key,
    required this.sizeButton,
    required this.sizeButtonIcon,
    required this.borderWidthButton,
    required this.borderRadiusButton,
    required this.shadowColor,
    required this.shadowWidthButton,
    required this.backgroundColor,
    required this.onPress,
    required this.buttonAnimationController,
    required this.svgPictureUrl,
    required this.disabled,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadiusButton),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              height: sizeButton / 2,
              width: sizeButton + borderWidthButton * 2,
              decoration: BoxDecoration(
                color: shadowColor,
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                ),
              ),
            ),
          ),
          PositionedTransition(
            rect: RelativeRectTween(
              begin: RelativeRect.fromSize(
                Rect.fromLTWH(
                  0,
                  0,
                  sizeButton + borderWidthButton * 2,
                  sizeButton + borderWidthButton * 2,
                ),
                Size(
                  sizeButton + borderWidthButton * 2,
                  sizeButton + borderWidthButton * 2 + shadowWidthButton,
                ),
              ),
              end: RelativeRect.fromSize(
                Rect.fromLTWH(
                  0,
                  shadowWidthButton,
                  sizeButton + borderWidthButton * 2,
                  sizeButton + borderWidthButton * 2,
                ),
                Size(
                  sizeButton + borderWidthButton * 2,
                  sizeButton + borderWidthButton * 2 + shadowWidthButton,
                ),
              ),
            ).animate(buttonAnimationController),
            child: Material(
              type: MaterialType.transparency,
              child: Ink(
                width: sizeButton + borderWidthButton * 2,
                height: sizeButton + borderWidthButton * 2,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: borderWidthButton,
                  ),
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(borderRadiusButton),
                ),
                child: InkWell(
                  onTap: onPress,
                  onTapDown: (details) => disabled
                      ? null
                      : buttonAnimationController.forward().then(
                            (value) => buttonAnimationController.reverse(),
                          ),
                  borderRadius: BorderRadius.circular(borderRadiusButton),
                  child: Container(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      svgPictureUrl,
                      width: sizeButtonIcon,
                      height: sizeButtonIcon,
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (disabled)
            Container(
              color: const Color.fromRGBO(0, 0, 0, 0.3),
            ),
        ],
      ),
    );
  }
}
