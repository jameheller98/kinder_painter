import 'package:flutter/material.dart';

class TextButtonContent extends StatelessWidget {
  final double borderRadius;
  final double height;
  final double width;
  final double layerWidth;
  final Color layerColor;
  final AnimationController animationController;
  final Color backgroundColor;
  final Color backgroundSubColor;
  final void Function() onPress;
  final String title;
  final double lineHeight;
  final double fontSize;
  final bool disabled;

  const TextButtonContent({
    super.key,
    required this.borderRadius,
    required this.height,
    required this.width,
    required this.layerWidth,
    required this.layerColor,
    required this.animationController,
    required this.backgroundColor,
    required this.backgroundSubColor,
    required this.onPress,
    required this.title,
    required this.lineHeight,
    required this.fontSize,
    required this.disabled,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              height: (height + layerWidth) / 2,
              width: width,
              color: layerColor,
            ),
          ),
          PositionedTransition(
            rect: RelativeRectTween(
              begin: RelativeRect.fromSize(
                Rect.fromLTWH(0, 0, width, height),
                Size(width, height + layerWidth),
              ),
              end: RelativeRect.fromSize(
                Rect.fromLTWH(0, 0, width, height + layerWidth),
                Size(width, height + layerWidth),
              ),
            ).animate(animationController),
            child: Container(
              height: height,
              width: width,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                color: backgroundColor,
              ),
              child: Transform.translate(
                offset: Offset(0, height / 2),
                child: Transform.rotate(
                  angle: 0.8,
                  alignment: Alignment.topCenter,
                  child: Transform.scale(
                    scale: 2,
                    alignment: Alignment.topCenter,
                    child: Container(
                      decoration: BoxDecoration(
                        color: backgroundSubColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          PositionedTransition(
            rect: RelativeRectTween(
              begin: RelativeRect.fromSize(
                Rect.fromLTWH(0, 0, width, height),
                Size(width, height + layerWidth),
              ),
              end: RelativeRect.fromSize(
                Rect.fromLTWH(0, 0, width, height + layerWidth),
                Size(width, height + layerWidth),
              ),
            ).animate(animationController),
            child: Material(
              type: MaterialType.transparency,
              child: Ink(
                height: height,
                width: width,
                child: InkWell(
                  onTap: !disabled ? onPress : null,
                  onTapDown: !disabled
                      ? (details) => animationController.forward().then(
                            (value) => animationController.reverse(),
                          )
                      : null,
                  child: Center(
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            height: lineHeight / fontSize,
                            color: Colors.white,
                            fontFamily: 'ToySans',
                            fontSize: fontSize,
                            letterSpacing: 0.64,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
