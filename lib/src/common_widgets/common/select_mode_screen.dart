import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

import 'package:master_source_flutter/src/common_widgets/cards/feature_card/feature_card.dart';
import 'package:master_source_flutter/src/common_widgets/group_button_system/group_button_system.dart';
import 'package:master_source_flutter/src/constants/theme_model.dart';

class SelectModeScreen extends ConsumerStatefulWidget {
  const SelectModeScreen({super.key});

  @override
  ConsumerState<SelectModeScreen> createState() => _SelectModeScreenState();
}

class _SelectModeScreenState extends ConsumerState<SelectModeScreen> {
  bool _loadingFirst = true;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer(const Duration(milliseconds: 1000), () {
      setState(
        () {
          _loadingFirst = false;
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedOpacity(
          duration: const Duration(milliseconds: 1000),
          opacity: _loadingFirst ? 0 : 1,
          curve: Curves.easeInOut,
          child: GroupButtonSystem(
            buttonGroup: const {
              ButtonGroup.upgrade: ButtonPosition.right,
              ButtonGroup.notification: ButtonPosition.right,
              ButtonGroup.setting: ButtonPosition.right
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Lottie.asset('assets/lotties/mascot.json'),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 17),
                  child: Column(
                    children: [
                      const SizedBox(height: 57),
                      Row(
                        children: [
                          FeatureCard(
                            onPress: () {},
                            title: 'FLASH CARD',
                            themeName: ThemeNameButtonText.blue,
                            lottieUrl: 'assets/lotties/flashcard-draw.json',
                            bgImageUrl:
                                'assets/images/feature_cards/flashcard-image.png',
                          ),
                          const SizedBox(width: 29),
                          FeatureCard(
                            onPress: () {},
                            title: 'TÔ ẢNH TĨNH',
                            themeName: ThemeNameButtonText.purple,
                            lottieUrl: 'assets/lotties/static-draw.json',
                            bgImageUrl:
                                'assets/images/feature_cards/static-image.png',
                          ),
                          const SizedBox(width: 29),
                          FeatureCard(
                            onPress: () {},
                            title: 'TÔ HOẠT CẢNH',
                            themeName: ThemeNameButtonText.pink,
                            lottieUrl: 'assets/lotties/dynamic-draw.json',
                            bgImageUrl:
                                'assets/images/feature_cards/dynamic-image.png',
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          FeatureCard(
                            onPress: () {},
                            title: 'VẼ TỰ DO',
                            themeName: ThemeNameButtonText.red,
                            lottieUrl: 'assets/lotties/freedom-draw.json',
                            bgImageUrl:
                                'assets/images/feature_cards/freedom-image.png',
                          ),
                          const SizedBox(width: 29),
                          FeatureCard(
                            onPress: () {},
                            title: 'KIẾN THỨC MÀU',
                            themeName: ThemeNameButtonText.yellow,
                            lottieUrl: 'assets/lotties/knowledge-draw.json',
                            bgImageUrl:
                                'assets/images/feature_cards/knowledge-image.png',
                          ),
                          const SizedBox(width: 29),
                          FeatureCard(
                            onPress: () {},
                            title: 'DẠY VẼ',
                            themeName: ThemeNameButtonText.aqua,
                            lottieUrl: 'assets/lotties/study-draw.json',
                            bgImageUrl:
                                'assets/images/feature_cards/study-image.png',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (_loadingFirst)
          Center(
            child: SizedBox(
              height: 40,
              child: Lottie.asset('assets/lotties/loading.json'),
            ),
          ),
      ],
    );
  }

  @override
  void dispose() {
    _timer.cancel();

    super.dispose();
  }
}
