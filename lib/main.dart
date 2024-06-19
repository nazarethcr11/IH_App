import 'package:flutter/material.dart';
import 'package:inclusive_hue/models/color_transformation.dart';
import 'package:inclusive_hue/pages/home_page.dart';
import 'package:inclusive_hue/pages/login_page.dart';
import 'package:inclusive_hue/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => ColorFilterProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorFilterProvider>(
      builder: (context, colorFilterProvider, child) {
        return ColorFiltered(
          colorFilter: colorFilterProvider.colorFilter,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: LoginPage(),
            theme: Provider.of<ThemeProvider>(context).themeData,
          ),
        );
      },
    );
  }
}

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


