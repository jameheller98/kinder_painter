import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:master_source_flutter/src/common_widgets/common/loading_overlay.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  late VideoPlayerController _videoController;
  bool _isWaitingVideo = true;
  double _opacity = 1;

  @override
  void initState() {
    super.initState();

    _videoController =
        VideoPlayerController.asset('assets/videos/splash-screen.mp4')
          ..initialize().then((_) => setState(() {}));

    _videoController.addListener(() {
      if (_videoController.value.position >
              const Duration(milliseconds: 5500) &&
          _opacity == 1) {
        setState(() {
          _opacity = 0;
        });

        LoadingOverlay.of(context).show(hasBarrier: false);
      }

      if (!_isWaitingVideo && !_videoController.value.isPlaying) {
        setState(() {
          _isWaitingVideo = true;
        });

        context.go('/select-mode-screen');
      }
    });

    Future.delayed(const Duration(milliseconds: 2000), () {
      setState(() {
        _isWaitingVideo = false;
      });

      _videoController.play();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _opacity,
      duration: const Duration(milliseconds: 750),
      curve: Curves.easeOutQuad,
      child: !_isWaitingVideo
          ? FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _videoController.value.size.width,
                height: _videoController.value.size.height,
                child: VideoPlayer(_videoController),
              ),
            )
          : const SizedBox.shrink(),
    );
  }

  @override
  void dispose() {
    _videoController.dispose();

    super.dispose();
  }
}
