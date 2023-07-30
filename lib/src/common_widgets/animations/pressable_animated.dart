import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PressableAnimated extends ConsumerStatefulWidget {
  final Widget child;
  final void Function() onPress;

  const PressableAnimated({
    super.key,
    required this.child,
    required this.onPress,
  });

  @override
  ConsumerState<PressableAnimated> createState() => _PressableAnimatedState();
}

class _PressableAnimatedState extends ConsumerState<PressableAnimated>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _animationController.forward().then(
              (value) => _animationController.reverse().then(
                (value) {
                  widget.onPress();
                },
              ),
            );
      },
      child: AnimatedBuilder(
        builder: (ctx, child) => Transform.scale(
          scale: 1 - _animationController.value * (1 - 0.9),
          child: Transform.rotate(
              angle: _animationController.value *
                  (2 - _animationController.value * 2.5) *
                  0.1,
              child: child),
        ),
        animation: _animationController,
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }
}
