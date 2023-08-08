import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:master_source_flutter/src/features/drawing/presentation/draw_controller.dart';

class DrawSize extends ConsumerWidget {
  const DrawSize({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sizeCanvas = ref.watch(sizeCanvasProvider);

    return Container(
      width: sizeCanvas.width,
      height: sizeCanvas.height,
      color: Colors.transparent,
    );
  }
}
