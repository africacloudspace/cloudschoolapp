import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

import 'app/app.locator.dart';
import 'app/app.router.dart';
import 'app_themes/app_theme.dart';

void main() async {
  setupLocator();

  WidgetsFlutterBinding.ensureInitialized();
  await ThemeManager.initialise();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarBrightness: Brightness.light));
    return ThemeBuilder(
      defaultThemeMode: ThemeMode.light,
      darkTheme: AppThemeConfig.getThemeFromThemeMode(2),
      lightTheme: AppThemeConfig.getThemeFromThemeMode(1),
      builder: (context, regularTheme, darkTheme, themeMode) => GetMaterialApp(
        themeMode: themeMode!,
        theme: regularTheme,
        navigatorKey: StackedService.navigatorKey,
        onGenerateRoute: StackedRouter().onGenerateRoute,
        debugShowCheckedModeBanner: false,
        title: 'Teachers CloudSchool app',
        darkTheme: darkTheme,
      ),
    );
  }
}
