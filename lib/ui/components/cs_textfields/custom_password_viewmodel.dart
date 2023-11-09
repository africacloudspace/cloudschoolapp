import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CustomPasswordViewModel extends BaseViewModel {
  bool passwordVisible = false;

  bool get passwordVisibleGet => passwordVisible;

  void passwordVisibility() {
    passwordVisible = !passwordVisible;
    notifyListeners();
  }

  String? validate(String? value, String? errorTextId) {
    if (value!.isEmpty) {
      return 'Please enter a $errorTextId';
    }
  }
}
