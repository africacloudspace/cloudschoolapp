import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:teacher_cloudschool/app/app.locator.dart';
import 'package:teacher_cloudschool/services/alert_service.dart';

class ChangePasswordViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AlertService _alertService = locator<AlertService>();

  TextEditingController? _previousPasswordController = TextEditingController();

  TextEditingController? get previousPasswordController =>
      _previousPasswordController;

  TextEditingController? _newPasswordController = TextEditingController();

  TextEditingController? get newPasswordController => _newPasswordController;

  TextEditingController? _confirmPasswordController = TextEditingController();

  TextEditingController? get confirmPasswordController =>
      _confirmPasswordController;

  String? validateFormsKey(String? formKey) {
    String? errorMessage;
    if (formKey == 'previous') {
      (_previousPasswordController!.text.isEmpty)
          ? errorMessage = 'Please enter your Previous Password'
          : errorMessage = '';
    } else if (formKey == 'new') {
      (_newPasswordController!.text.isEmpty)
          ? errorMessage = 'Please enter your new Password'
          : errorMessage = '';
    } else if (formKey == 'confirm') {
      (_confirmPasswordController!.text.isEmpty)
          ? errorMessage = 'Please enter your new password again'
          : errorMessage = '';
    } else {
      return null;
    }
    return errorMessage;
  }

  void submit() {
    _navigationService.popRepeated(1);
  }
}
