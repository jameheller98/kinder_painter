import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'layout_controller.g.dart';

enum BackgroundImage {
  splashScreen,
}

@riverpod
BackgroundImage takeBackgroundImage(TakeBackgroundImageRef ref) {
  return BackgroundImage.splashScreen;
}
