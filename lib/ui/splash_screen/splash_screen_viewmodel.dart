import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:teacher_cloudschool/app/app.locator.dart';
import 'package:teacher_cloudschool/app/app.router.dart';

class SplashScreenViewModel extends BaseViewModel {
  final NavigationService navigationService = locator<NavigationService>();

  void toLoginUserName() {
    navigationService.navigateTo(Routes.loginUserNameView);
  }
}
