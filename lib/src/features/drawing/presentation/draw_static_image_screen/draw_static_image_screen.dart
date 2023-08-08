import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:master_source_flutter/src/common_widgets/common/loading_overlay.dart';
import 'package:master_source_flutter/src/features/drawing/presentation/draw/draw.dart'
    as draw_container;
import 'package:master_source_flutter/src/features/drawing/presentation/draw_controller.dart';
import 'package:master_source_flutter/src/features/drawing/presentation/draw_static_image_screen/material_picker.dart';
import 'package:master_source_flutter/src/features/drawing/presentation/draw_static_image_screen/paintbrush_picker.dart';
import 'package:master_source_flutter/src/features/drawing/presentation/draw_static_image_screen/tool_bar.dart';
import 'package:master_source_flutter/src/features/drawing/presentation/draw_static_image_screen/tool_group.dart';

class DrawStaticImageScreen extends ConsumerWidget {
  const DrawStaticImageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modeLeft = ref.watch(modeToolLeftStateProvider);
    final modeRight = ref.watch(modeToolRightStateProvider);

    ref.listen(drawControllerProvider, (prev, next) {
      if (!prev!.hasValue) {
        LoadingOverlay.of(context).hide();
      }
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            draw_container.Draw(),
            ToolGroup(),
          ],
        ),
        if (modeRight != ModeToolRight.move && modeLeft == ModeToolLeft.idle)
          const SizedBox(width: 98),
        if (modeLeft == ModeToolLeft.material) ...[
          const SizedBox(width: 20),
          const MaterialPicker(),
          const SizedBox(width: 20),
        ],
        if (modeLeft == ModeToolLeft.brush) const PaintbrushPicker(),
        const ToolBar(),
      ],
    );
  }
}
