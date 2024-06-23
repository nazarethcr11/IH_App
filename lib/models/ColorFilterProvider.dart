import 'package:flutter/material.dart';
import 'package:inclusive_hue/models/color_transformation.dart';

class ColorFilterProvider extends ChangeNotifier {
  bool isToggled = false;
  double colorAdjustment = 0.0;
  double severity = 0.0;
  String colorType = 'PROTANOMALY';

  void updateColorFilter({required bool toggled, required double adjustment, required double severityValue, required String type}) {
    isToggled = toggled;
    colorAdjustment = adjustment;
    severity = severityValue;
    colorType = type;
    notifyListeners();
  }

  ColorFilter get colorFilter {
    if (isToggled) {
      return getColorFilterForTypeAndSeverity(colorType, severity / 100, colorAdjustment / 100);
    } else {
      return ColorFilter.mode(Colors.transparent, BlendMode.multiply);
    }
  }
}

