import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:master_source_flutter/src/features/drawing/presentation/draw/draw_size.dart';
import 'package:master_source_flutter/src/features/drawing/presentation/draw_controller.dart';
import 'package:master_source_flutter/src/features/drawing/presentation/scale_pan_controller.dart';

class DrawBackground extends ConsumerWidget {
  const DrawBackground({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modeLeft = ref.watch(modeToolLeftStateProvider);

    return GestureDetector(
      onPanStart: modeLeft != ModeToolLeft.idle
          ? (details) {
              ref.read(modeToolLeftStateProvider.notifier).state =
                  ModeToolLeft.brush;
              ref
                  .read(drawControllerProvider.notifier)
                  .handleTouchStart(details);
            }
          : null,
      onPanUpdate: modeLeft != ModeToolLeft.idle
          ? ref.read(drawControllerProvider.notifier).handleTouchMove
          : null,
      onPanEnd: modeLeft != ModeToolLeft.idle
          ? ref.read(drawControllerProvider.notifier).handleTouchEnd
          : null,
      onScaleStart: modeLeft == ModeToolLeft.idle
          ? ref.read(scalePanControllerProvider.notifier).handleScaleAndPanStart
          : null,
      onScaleUpdate: modeLeft == ModeToolLeft.idle
          ? ref.read(scalePanControllerProvider.notifier).handleScaleAndPanMove
          : null,
      onScaleEnd: modeLeft == ModeToolLeft.idle
          ? ref.read(scalePanControllerProvider.notifier).handleScaleAndPanEnd
          : null,
      child: const DrawSize(),
    );
  }
}
