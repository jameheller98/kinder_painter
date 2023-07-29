import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:master_source_flutter/src/common_providers/layout_controller.dart';

class Layout extends ConsumerStatefulWidget {
  final Widget child;

  const Layout({super.key, required this.child});

  @override
  ConsumerState<Layout> createState() => _LayoutState();
}

class _LayoutState extends ConsumerState<Layout> {
  late Image splashScreenImage;

  @override
  void initState() {
    super.initState();

    splashScreenImage =
        Image.asset('assets/images/backgrounds/splash-screen.png');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    precacheImage(splashScreenImage.image, context);
  }

  ImageProvider handleChangeBackgroundImage(BackgroundImage image) {
    switch (image) {
      case BackgroundImage.splashScreen:
        return splashScreenImage.image;
      default:
        return splashScreenImage.image;
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentBackgroundImage = ref.watch(takeBackgroundImageProvider);

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: handleChangeBackgroundImage(currentBackgroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: widget.child,
    );
  }
}
