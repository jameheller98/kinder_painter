import 'package:flutter/material.dart';

class LangConfig {
  static const langList = [
    'en',
    'vi',
  ];

  static List<Locale> supportedLocales() {
    final List<Locale> localList = [];

    for (final lang in langList) {
      final local = Locale(lang, '');

      localList.add(local);
    }

    return localList;
  }
}
