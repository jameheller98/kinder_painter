import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:master_source_flutter/src/constants/theme_model.dart';
import 'package:master_source_flutter/src/common_widgets/animations/pressable_animated.dart';
import 'package:master_source_flutter/src/common_widgets/buttons/text_button_custom/text_button_custom.dart';

class FeatureCard extends StatelessWidget {
  final String title;
  final String lottieUrl;
  final String bgImageUrl;
  final ThemeNameButtonText themeName;
  final void Function() onPress;

  const FeatureCard({
    super.key,
    required this.title,
    required this.lottieUrl,
    required this.bgImageUrl,
    required this.themeName,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return PressableAnimated(
      onPress: onPress,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(0),
        elevation: 5,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 135 + 4,
              height: 135 + 4,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Stack(
                  children: [
                    Image.asset(bgImageUrl),
                    Center(
                      child: Container(
                        width: 123,
                        height: 123,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.transparent, width: 4.2),
                          borderRadius: BorderRadius.circular(8),
                          color: const Color.fromRGBO(0, 0, 0, 0.2),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Lottie.asset(lottieUrl),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: -3,
              child: Container(
                width: 135 + 4,
                alignment: Alignment.center,
                child: TextButtonCustom(
                  onPress: () {},
                  themeName: themeName,
                  title: title,
                  width: 100,
                  height: 22.4,
                  border: const {'width': 3, 'radius': 100},
                  text: const {'lineHeight': 13.42, 'fontSize': 10},
                  disabled: true,
                  isShadow: true,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
