import 'package:flutter/foundation.dart';

class DimensionUtils {
  static final _viewDevice = PlatformDispatcher.instance.views.first;
  static final _devicePixelRatio = _viewDevice.devicePixelRatio;
  static final _physicalHeight = _viewDevice.physicalSize.height;
  static final _physicalWidth = _viewDevice.physicalSize.width;

  static const logicalWidthDefault = 812, logicalHeightDefault = 375;
  static final logicalHeight = _physicalHeight / _devicePixelRatio;
  static final logicalWidth = _physicalWidth / _devicePixelRatio;
}
