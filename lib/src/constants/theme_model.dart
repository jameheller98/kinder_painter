import 'package:flutter/material.dart';

enum ThemeNameButtonIcon { purple, yellow, green }

enum ThemeNameButtonText { emerald, blue, purple, pink, red, yellow, aqua }

class ThemeButtonIcon {
  final String name;
  final Color backgroundColor;
  final Color shadowColor;

  const ThemeButtonIcon({
    required this.name,
    required this.backgroundColor,
    required this.shadowColor,
  });
}

class ThemeButtonText {
  final String name;
  final Color backgroundColor;
  final Color backgroundSubColor;
  final Color layerColor;

  const ThemeButtonText({
    required this.name,
    required this.backgroundColor,
    required this.backgroundSubColor,
    required this.layerColor,
  });
}
