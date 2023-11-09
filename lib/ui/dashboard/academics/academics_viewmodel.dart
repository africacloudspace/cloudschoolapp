import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:teacher_cloudschool/app/app.router.dart';

import '../../../app/app.locator.dart';

class AcademicsViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  void navigateToCBC() {
    _navigationService.navigateTo(Routes.cBCCurriculumView);
  }
}
