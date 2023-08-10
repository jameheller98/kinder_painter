import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:master_source_flutter/src/features/drawing/domain/material.dart';

import 'package:master_source_flutter/src/features/drawing/presentation/materials_controller.dart';
import 'package:master_source_flutter/src/utils/dimension_utils.dart';

class MaterialPicker extends ConsumerStatefulWidget {
  const MaterialPicker({super.key});

  @override
  ConsumerState<MaterialPicker> createState() => _MaterialPickerState();
}

class _MaterialPickerState extends ConsumerState<MaterialPicker> {
  final CarouselController carouselController = CarouselController();
  late int initPage;

  @override
  void initState() {
    super.initState();

    initPage = ref
            .read(materialsControllerProvider)
            .value
            ?.currentMaterial
            .indexDrawMaterialActive ??
        0;
  }

  @override
  Widget build(BuildContext context) {
    final drawMaterialsAsync = ref.watch(
      materialsControllerProvider.select(
        (value) => AsyncData(
          value.value?.currentMaterial,
        ),
      ),
    );

    ref.listen(materialsControllerProvider, (previous, next) {
      if (previous != null &&
          previous.value?.currentMaterial.id !=
              next.value?.currentMaterial.id) {
        carouselController.jumpToPage(
          next.value?.currentMaterial.indexDrawMaterialActive ?? 0,
        );
      }
    });

    return drawMaterialsAsync.when(
      data: (currentMaterial) => Container(
        clipBehavior: Clip.none,
        width: 58,
        decoration: BoxDecoration(
          border: Border.symmetric(
            vertical: BorderSide(width: 4, color: Colors.amber.shade50),
          ),
        ),
        child: Stack(
          children: [
            CarouselSlider(
              carouselController: carouselController,
              options: CarouselOptions(
                height: double.infinity,
                scrollDirection: Axis.vertical,
                initialPage: initPage,
                enableInfiniteScroll: true,
                viewportFraction: 50 / DimensionUtils.logicalHeight,
                onPageChanged: ref
                    .read(materialsControllerProvider.notifier)
                    .handleChangeColor,
              ),
              items: currentMaterial!.type == TypeMaterial.color
                  ? currentMaterial.colors.map((color) {
                      final currentIndexColor =
                          currentMaterial.colors.indexOf(color);

                      return Builder(
                        builder: (BuildContext context) {
                          return ElevatedButton(
                            onPressed: () => carouselController.animateToPage(
                              currentIndexColor,
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: color.color,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                                side: BorderSide.none,
                              ),
                              disabledBackgroundColor: color.color,
                            ),
                            child: const SizedBox.square(dimension: 50),
                          );
                        },
                      );
                    }).toList()
                  : [],
            ),
            Positioned(
              top: DimensionUtils.logicalHeight / 2,
              right: 3,
              child: Container(
                width: 0,
                height: 0,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.transparent,
                      width: 7,
                    ),
                    left: BorderSide(
                      color: Colors.black,
                      width: 10,
                    ),
                    top: BorderSide(
                      color: Colors.transparent,
                      width: 7,
                    ),
                    right: BorderSide(
                      color: Colors.transparent,
                      width: 12,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      loading: () => const SizedBox(width: 58),
      error: (error, stackTrace) => const SizedBox(width: 58),
    );
  }
}
