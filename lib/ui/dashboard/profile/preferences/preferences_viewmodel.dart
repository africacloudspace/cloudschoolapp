import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:teacher_cloudschool/app/app.locator.dart';

class PreferencesViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final ThemeService _themeService = locator<ThemeService>();

  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  set isDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }

  void toggleTheme() {
    if (_isDarkMode == false) {
      _themeService.toggleDarkLightTheme();
    } else {
      _themeService.toggleDarkLightTheme();
    }
    notifyListeners();
  }
}
