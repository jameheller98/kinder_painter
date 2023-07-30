import 'package:flutter/material.dart';

import 'package:master_source_flutter/src/constants/theme_model.dart';

final themeButtonIcon = {
  ThemeNameButtonIcon.purple: ThemeButtonIcon(
    name: ThemeNameButtonIcon.purple.name,
    backgroundColor: const Color.fromRGBO(215, 99, 255, 1),
    shadowColor: const Color.fromRGBO(167, 94, 234, 1),
  ),
  ThemeNameButtonIcon.yellow: ThemeButtonIcon(
    name: ThemeNameButtonIcon.yellow.name,
    backgroundColor: const Color.fromRGBO(255, 197, 0, 1),
    shadowColor: const Color.fromRGBO(255, 197, 0, 1),
  ),
  ThemeNameButtonIcon.green: ThemeButtonIcon(
    name: ThemeNameButtonIcon.green.name,
    backgroundColor: const Color.fromRGBO(38, 222, 128, 1),
    shadowColor: const Color.fromRGBO(0, 244, 199, 1),
  ),
};

final themeButtonText = {
  ThemeNameButtonText.emerald: ThemeButtonText(
    name: ThemeNameButtonText.emerald.name,
    backgroundColor: const Color.fromRGBO(44, 204, 186, 1),
    backgroundSubColor: const Color.fromRGBO(0, 234, 211, 1),
    layerColor: const Color.fromRGBO(16, 185, 178, 1),
  ),
  ThemeNameButtonText.blue: ThemeButtonText(
    name: ThemeNameButtonText.emerald.name,
    backgroundColor: const Color.fromRGBO(33, 146, 255, 1),
    backgroundSubColor: const Color.fromRGBO(95, 171, 253, 1),
    layerColor: const Color.fromRGBO(11, 71, 242, 1),
  ),
  ThemeNameButtonText.purple: ThemeButtonText(
    name: ThemeNameButtonText.purple.name,
    backgroundColor: const Color.fromRGBO(221, 128, 253, 1),
    backgroundSubColor: const Color.fromRGBO(227, 157, 251, 1),
    layerColor: const Color.fromRGBO(164, 96, 237, 1),
  ),
  ThemeNameButtonText.pink: ThemeButtonText(
    name: ThemeNameButtonText.pink.name,
    backgroundColor: const Color.fromRGBO(253, 116, 214, 1),
    backgroundSubColor: const Color.fromRGBO(250, 168, 226, 1),
    layerColor: const Color.fromRGBO(255, 84, 207, 1),
  ),
  ThemeNameButtonText.red: ThemeButtonText(
    name: ThemeNameButtonText.red.name,
    backgroundColor: const Color.fromRGBO(255, 75, 0, 1),
    backgroundSubColor: const Color.fromRGBO(253, 92, 101, 1),
    layerColor: const Color.fromRGBO(235, 59, 91, 1),
  ),
  ThemeNameButtonText.yellow: ThemeButtonText(
    name: ThemeNameButtonText.yellow.name,
    backgroundColor: const Color.fromRGBO(255, 197, 0, 1),
    backgroundSubColor: const Color.fromRGBO(254, 210, 48, 1),
    layerColor: const Color.fromRGBO(248, 183, 50, 1),
  ),
  ThemeNameButtonText.aqua: ThemeButtonText(
    name: ThemeNameButtonText.emerald.name,
    backgroundColor: const Color.fromRGBO(0, 234, 211, 1),
    backgroundSubColor: const Color.fromRGBO(44, 204, 186, 1),
    layerColor: const Color.fromRGBO(16, 185, 178, 1),
  )
};
