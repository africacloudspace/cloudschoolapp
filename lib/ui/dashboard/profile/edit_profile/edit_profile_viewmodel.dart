import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:teacher_cloudschool/app/app.locator.dart';
import 'package:teacher_cloudschool/services/alert_service.dart';

class EditProfileViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AlertService _alertService = locator<AlertService>();

  TextEditingController? _firstNameController = TextEditingController();

  TextEditingController? get firstNameController => _firstNameController;

  TextEditingController? _lastNameController = TextEditingController();

  TextEditingController? get lastNameController => _lastNameController;

  TextEditingController? _emailController = TextEditingController();

  TextEditingController? get emailController => _emailController;

  TextEditingController? _phoneNumberController = TextEditingController();

  TextEditingController? get phoneNumberController => _phoneNumberController;

  String? validateFormsKey(String? formKey) {
    String? errorMessage;
    if (formKey == 'firstName') {
      (_firstNameController!.text.isEmpty)
          ? errorMessage = 'Please enter First Name'
          : errorMessage = '';
    } else if (formKey == 'lastName') {
      (_firstNameController!.text.isEmpty)
          ? errorMessage = 'Please enter Last Name'
          : errorMessage = '';
    } else if (formKey == 'email') {
      (_emailController!.text.isEmpty)
          ? errorMessage = 'Please enter Email'
          : errorMessage = '';
    } else if (formKey == 'phone') {
      (_phoneNumberController!.text.isEmpty)
          ? errorMessage = 'Please enter Phone'
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
