import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:teacher_cloudschool/app/app.locator.dart';
import 'package:teacher_cloudschool/app/app.router.dart';

import '../../components/custom_snackbar.dart';

class LoginPasswordViewModel extends BaseViewModel {
  final NavigationService navigationService = locator<NavigationService>();

  TextEditingController? _passwordController = TextEditingController();

  TextEditingController? get passwordController => _passwordController;

  String? validateForm(String? password) {
    if (password == null || password.isEmpty) {
      return 'Please enter a password';
    }
    return 'Success';
  }

  void toDashboard(String? password) {
    String? validationMessage;
    validationMessage = validateForm(password);

    if (validationMessage != 'Success') {
      notifyListeners();
      showCustomSnackBar(validationMessage,
          isError: true, duration: const Duration(minutes: 10));
    } else {
      navigationService.navigateTo(Routes.dashboardView);
    }
  }

  void toForgotPassword() {
    navigationService.navigateTo(Routes.forgotPasswordView);
  }

  String? validateFormKey(String? formKey) {
    String? errorMessage;
    if (formKey == 'password') {
      (_passwordController!.text.isEmpty)
          ? errorMessage = 'Please enter your password'
          : errorMessage = '';
    } else {
      return null;
    }
    return errorMessage;
  }
}
