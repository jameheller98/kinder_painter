import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:master_source_flutter/src/features/drawing/domain/material.dart';

import 'package:master_source_flutter/src/features/drawing/presentation/draw_controller.dart';
import 'package:master_source_flutter/src/features/drawing/presentation/materials_controller.dart';

class ToolMaterial extends ConsumerWidget {
  const ToolMaterial({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final drawMaterialsAsync = ref.watch(materialsControllerProvider);

    return drawMaterialsAsync.when(
      data: (drawMaterial) => GridView.count(
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        crossAxisCount: 2,
        children: [
          for (final material in drawMaterial.materials) ...[
            if (material.type == TypeMaterial.color)
              ElevatedButton(
                onPressed: () {
                  ref.read(modeToolLeftStateProvider.notifier).state =
                      ModeToolLeft.material;
                  ref
                      .read(materialsControllerProvider.notifier)
                      .handleChangeMaterial(material);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: material.getColor,
                  elevation: 0,
                  shape: CircleBorder(
                      side: material.isActive
                          ? const BorderSide(
                              width: 3,
                              color: Colors.black45,
                              strokeAlign: 1,
                            )
                          : BorderSide.none),
                  disabledBackgroundColor: material.getColor,
                ),
                child: const SizedBox.shrink(),
              ),
            if (material.type == TypeMaterial.pattern)
              ElevatedButton(
                onPressed: () {
                  ref.read(modeToolLeftStateProvider.notifier).state =
                      ModeToolLeft.material;
                  ref
                      .read(materialsControllerProvider.notifier)
                      .handleChangeMaterial(material);
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: CircleBorder(
                    side: material.isActive
                        ? const BorderSide(
                            width: 3,
                            color: Colors.black45,
                            strokeAlign: 1,
                          )
                        : BorderSide.none,
                  ),
                  disabledBackgroundColor: material.getColor,
                ),
                child: const SizedBox.shrink(),
              ),
          ],
        ],
      ),
      error: (error, stackTrace) => const SizedBox.shrink(),
      loading: () => const SizedBox.shrink(),
    );
  }
}
