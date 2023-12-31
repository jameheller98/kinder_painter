import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:master_source_flutter/src/common_widgets/buttons/icon_button_custom/icon_button_custom.dart';
import 'package:master_source_flutter/src/constants/theme_model.dart';
import 'package:master_source_flutter/src/features/drawing/presentation/draw_controller.dart';
import 'package:master_source_flutter/src/features/drawing/presentation/draw_static_image_screen/tool_material.dart';
import 'package:master_source_flutter/src/features/drawing/presentation/scale_pan_controller.dart';

class ToolBar extends ConsumerWidget {
  const ToolBar({
    super.key,
  });

  void handleChangeModeToolLeft(WidgetRef ref) {
    ref.read(modeToolLeftStateProvider.notifier).update((state) {
      return state == ModeToolLeft.material || state == ModeToolLeft.idle
          ? ModeToolLeft.brush
          : ModeToolLeft.material;
    });
  }

  void handleChangeModeToolRight(WidgetRef ref) {
    ref.read(modeToolRightStateProvider.notifier).update((state) {
      if (state == ModeToolRight.reset) {
        ref.read(scalePanControllerProvider.notifier).resetScaleAndPan();
        handleChangeModeToolLeft(ref);
      } else {
        ref.read(modeToolLeftStateProvider.notifier).state = ModeToolLeft.idle;
      }

      return state == ModeToolRight.move
          ? ModeToolRight.reset
          : ModeToolRight.move;
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modeLeft = ref.watch(modeToolLeftStateProvider);
    final modeRight = ref.watch(modeToolRightStateProvider);

    return Container(
      height: 320,
      width: 120,
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        color: Colors.amber.shade50,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButtonCustom(
                onPress: () => handleChangeModeToolLeft(ref),
                themeName: ThemeNameButtonIcon.blue,
                svgPictureUrl: modeLeft == ModeToolLeft.brush
                    ? 'assets/svgs/palette.svg'
                    : 'assets/svgs/paintbrush.svg',
              ),
              const SizedBox(width: 10),
              IconButtonCustom(
                onPress: () => handleChangeModeToolRight(ref),
                themeName: modeRight == ModeToolRight.move
                    ? ThemeNameButtonIcon.blue
                    : ThemeNameButtonIcon.red,
                svgPictureUrl: 'assets/svgs/move.svg',
              ),
            ],
          ),
          const SizedBox(height: 15),
          const Expanded(
            child: ToolMaterial(),
          ),
          const SizedBox(height: 15),
          IconButtonCustom(
            onPress: () => ref
                .read(drawControllerProvider.notifier)
                .handleSaveImage(context),
            themeName: ThemeNameButtonIcon.turquoise,
            svgPictureUrl: 'assets/svgs/check.svg',
          ),
        ],
      ),
    );
  }
}
