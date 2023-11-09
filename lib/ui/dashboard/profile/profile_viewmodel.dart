import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:teacher_cloudschool/app/app.locator.dart';
import 'package:teacher_cloudschool/app/app.router.dart';

class ProfileViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  void toPreferences() {
    _navigationService.navigateTo(Routes.preferencesView);
  }

  void toEditProfile() {
    _navigationService.navigateTo(Routes.editProfile);
  }

  void toChangePassword() {
    _navigationService.navigateTo(Routes.changePasswordView);
  }

  void logOut() {
    _navigationService.popRepeated(1);
  }
}
