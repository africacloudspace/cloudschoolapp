import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:teacher_cloudschool/app/app.locator.dart';
import 'package:teacher_cloudschool/app/app.router.dart';

import '../../components/custom_snackbar.dart';

class LoginUserNameViewModel extends BaseViewModel {
  final NavigationService navigationService = locator<NavigationService>();

  TextEditingController? _userNameController = TextEditingController();

  TextEditingController? get userNameController => _userNameController;

  String? validateFormsKey(String? formKey) {
    String? errorMessage;
    if (formKey == 'userName') {
      (_userNameController!.text.isEmpty)
          ? errorMessage = 'Please enter Email/Phone'
          : errorMessage = '';
    } else {
      return null;
    }
    return errorMessage;
  }

  String? validateForm(String? password) {
    if (password == null || password.isEmpty) {
      return 'Please enter a user name';
    }
    return 'Success';
  }

  void toLoginPassword(String? userName) {
    String? validationMessage;
    validationMessage = validateForm(userName);

    if (validationMessage != 'Success') {
      notifyListeners();
      showCustomSnackBar(validationMessage,
          isError: true, duration: const Duration(minutes: 10));
    } else {
      navigationService.navigateTo(Routes.loginPasswordView);
    }
  }
}
