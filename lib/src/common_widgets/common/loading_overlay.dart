import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingOverlay {
  static late BuildContext context;
  static OverlayEntry? overlayEntry;
  static Timer? _timerCountDown;
  static Timer? _timerLoadingOverlay;
  final Duration defaultLoadingDuration;

  LoadingOverlay({
    required this.defaultLoadingDuration,
  });

  static LoadingOverlay of(
    BuildContext contextWidget, {
    Duration duration = const Duration(seconds: 3),
  }) {
    context = contextWidget;

    return LoadingOverlay(defaultLoadingDuration: duration);
  }

  void show({hasBarrier = true}) {
    hide();

    assert(overlayEntry == null);

    _timerCountDown = Timer.periodic(const Duration(milliseconds: 1), (timer) {
      if (timer.tick >= defaultLoadingDuration.inMilliseconds) {
        _timerCountDown?.cancel();
      }
    });

    overlayEntry = OverlayEntry(
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              if (hasBarrier)
                const ModalBarrier(
                  dismissible: false,
                  color: Color.fromRGBO(0, 0, 0, 0.7),
                ),
              Center(
                child: SizedBox(
                  height: 40,
                  child: Lottie.asset('assets/lotties/loading.json'),
                ),
              ),
            ],
          ),
        );
      },
    );

    Overlay.of(context).insert(overlayEntry!);
  }

  void hide({void Function()? callback}) {
    if (_timerCountDown != null && _timerCountDown!.isActive) {
      _timerLoadingOverlay = Timer(defaultLoadingDuration, () {
        overlayEntry?.remove();
        overlayEntry = null;

        if (callback != null) {
          callback();
        }

        _timerLoadingOverlay?.cancel();
      });

      _timerCountDown!.cancel();
    } else {
      overlayEntry?.remove();
      overlayEntry = null;

      if (callback != null) {
        callback();
      }
    }
  }

  void trigger() {
    show();
    hide();
  }
}
