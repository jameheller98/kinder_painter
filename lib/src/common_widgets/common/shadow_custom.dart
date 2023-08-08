import 'dart:ui';

import 'package:flutter/material.dart';

class ShadowCustom extends StatelessWidget {
  final Widget child;
  final Color color;
  final double opacity;
  final Offset offset;
  final double blur;

  const ShadowCustom({
    super.key,
    required this.child,
    this.color = Colors.black,
    this.opacity = 1,
    required this.offset,
    this.blur = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.translate(
          offset: offset,
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(
              sigmaY: blur,
              sigmaX: blur,
              tileMode: TileMode.decal,
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.transparent,
                  width: 0,
                ),
              ),
              child: Opacity(
                opacity: opacity,
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(color, BlendMode.srcATop),
                  child: child,
                ),
              ),
            ),
          ),
        ),
        child,
      ],
    );
  }
}
