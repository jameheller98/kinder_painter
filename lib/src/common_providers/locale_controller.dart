import 'package:flutter/material.dart';
import 'package:master_source_flutter/src/config/app_config.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locale_controller.g.dart';

@riverpod
class LocaleController extends _$LocaleController {
  @override
  Locale build() {
    return Locale(AppConfig.defaultLanguage);
  }

  void setLocale(String code) {
    state = Locale(code);
  }
}
