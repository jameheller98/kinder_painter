import 'package:go_router/go_router.dart';

import 'package:master_source_flutter/src/features/drawing/presentation/draw_static_image_screen/draw_static_image_screen.dart';

final drawStaticImageRoute = [
  GoRoute(
    path: '/draw-static-image',
    builder: (context, state) => const DrawStaticImageScreen(),
  ),
];
