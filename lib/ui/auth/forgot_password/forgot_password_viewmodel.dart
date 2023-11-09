import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:teacher_cloudschool/app/app.locator.dart';

import '../../../app/app.router.dart';
import '../../components/custom_snackbar.dart';

class ForgotPasswordViewModel extends BaseViewModel {
  final NavigationService navigationService = locator<NavigationService>();

  TextEditingController? _phoneController = TextEditingController();

  TextEditingController? get phoneController => _phoneController;

  TextEditingController? _emailController = TextEditingController();

  TextEditingController? get emailController => _emailController;

  TextEditingController? _accountNoController = TextEditingController();

  TextEditingController? get accountNoController => _accountNoController;

  String? validateForm(
    String? fieldId,
  ) {
    if (fieldId == 'accountNo') {
      if (_accountNoController!.text == null ||
          _accountNoController!.text.isEmpty) {
        return 'Please enter an account No';
      }
    } else if (fieldId == 'email') {
      if (_emailController!.text == null || _emailController!.text.isEmpty) {
        return 'Please enter an email';
      }
    } else {
      if (_phoneController!.text == null || _phoneController!.text.isEmpty) {
        return 'Please enter a Phone Number';
      }
    }

    return 'Success';
  }

  String? validateFormOnSubmit(
      String? accountNo, String? email, String? phoneNumber) {
    if (accountNo == null || accountNo.isEmpty) {
      return 'Please enter an account number';
    } else if (email == null || email.isEmpty) {
      return 'Please enter an email';
    } else if (phoneNumber == null || phoneNumber.isEmpty) {
      return 'Please enter a phone number';
    }
    return 'Success';
  }

  void toPassword(
    String? accountNo,
    String? email,
    String? phoneNumber,
  ) {
    String? validationMessage;
    validationMessage = validateFormOnSubmit(accountNo, email, phoneNumber);

    if (validationMessage != 'Success') {
      notifyListeners();
      showCustomSnackBar(validationMessage,
          isError: true, duration: const Duration(minutes: 10));
    } else {
      navigationService.navigateTo(Routes.loginPasswordView);
    }
  }
}
