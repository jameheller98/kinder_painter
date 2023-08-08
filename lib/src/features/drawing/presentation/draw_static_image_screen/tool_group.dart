import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:master_source_flutter/src/common_widgets/buttons/icon_button_custom/icon_button_custom.dart';
import 'package:master_source_flutter/src/constants/theme_model.dart';
import 'package:master_source_flutter/src/features/drawing/presentation/draw_controller.dart';

class ToolGroup extends ConsumerWidget {
  const ToolGroup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final drewPathStackAsync = ref.watch(
      drawControllerProvider.select(
        (value) => AsyncData(value.value?.drewPathStack),
      ),
    );
    final undidPathStackAsync = ref.watch(
      drawControllerProvider.select(
        (value) => AsyncData(value.value?.undidPathStack),
      ),
    );
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          drewPathStackAsync.when(
            data: (drewPathStack) => IconButtonCustom(
              onPress: ref.read(drawControllerProvider.notifier).handleUndoPath,
              themeName: ThemeNameButtonIcon.yellow,
              svgPictureUrl: 'assets/svgs/undo.svg',
              disabled: drewPathStack?.isEmpty ?? true,
            ),
            error: (error, stackTrace) => const SizedBox.shrink(),
            loading: () => const SizedBox.shrink(),
          ),
          const SizedBox(width: 10),
          undidPathStackAsync.when(
            data: (undidPathStack) => IconButtonCustom(
              onPress: ref.read(drawControllerProvider.notifier).handleRedoPath,
              themeName: ThemeNameButtonIcon.yellow,
              svgPictureUrl: 'assets/svgs/redo.svg',
              disabled: undidPathStack?.isEmpty ?? true,
            ),
            error: (error, stackTrace) => const SizedBox.shrink(),
            loading: () => const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
