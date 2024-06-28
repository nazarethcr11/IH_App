import 'package:flutter/material.dart';
import 'package:inclusive_hue/pages/login_page.dart';
import 'package:inclusive_hue/themes/theme_provider.dart';
import 'package:provider/provider.dart';

import 'models/ColorFilterProvider.dart';

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

