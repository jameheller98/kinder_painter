import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import 'package:master_source_flutter/src/common_widgets/animations/pressable_animated.dart';
import 'package:master_source_flutter/src/common_widgets/common/shadow_custom.dart';
import 'package:master_source_flutter/src/features/drawing/domain/paintbrush.dart';
import 'package:master_source_flutter/src/features/drawing/presentation/paintbrush_controller.dart';

class Paintbrush extends ConsumerWidget {
  final String Function(Color? color) stringSvg;
  final TypePaintbrush type;

  const Paintbrush({
    super.key,
    required this.stringSvg,
    required this.type,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paintbrushAsync = ref.watch(paintbrushControllerProvider);

    return paintbrushAsync.when(
      data: (paintbrush) => PressableAnimated(
        onPress: () => ref
            .read(paintbrushControllerProvider.notifier)
            .handleChangePaintbrush(type),
        child: Transform.translate(
          offset: paintbrush.type == type
              ? const Offset(2, 0)
              : const Offset(10, 0),
          child: Transform.scale(
            scale: paintbrush.type == type ? 1.3 : 0.9,
            child: ShadowCustom(
              color: Colors.black,
              opacity: 0.25,
              offset: const Offset(0, 4),
              blur: 5,
              child: SvgPicture.string(
                stringSvg(
                  paintbrush.type == type &&
                          paintbrush.type != TypePaintbrush.eraser
                      ? paintbrush.type != TypePaintbrush.waterPaint
                          ? paintbrush.stroke!.color
                          : paintbrush.fill!
                      : null,
                ),
              ),
            ),
          ),
        ),
      ),
      loading: () => const SizedBox.shrink(),
      error: (error, stackTrace) => const SizedBox.shrink(),
    );
  }
}
