import 'package:go_router/go_router.dart';

import 'package:master_source_flutter/src/common_widgets/common/splash_screen.dart';
import 'package:master_source_flutter/src/common_widgets/common/select_mode_screen.dart';

final commonRoute = [
  GoRoute(
    path: '/splash-screen',
    builder: (context, state) => const SplashScreen(),
  ),
  GoRoute(
    path: '/select-mode-screen',
    builder: (context, state) => const SelectModeScreen(),
  ),
];
