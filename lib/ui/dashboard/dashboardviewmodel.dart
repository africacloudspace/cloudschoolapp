import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:teacher_cloudschool/app/app.locator.dart';
import 'package:teacher_cloudschool/ui/dashboard/academics/academics_view.dart';
import 'package:teacher_cloudschool/ui/dashboard/attendance/attendance_view.dart';
import 'package:teacher_cloudschool/ui/dashboard/home/home_view.dart';
import 'package:teacher_cloudschool/ui/dashboard/profile/profile_view.dart';

class DashboardViewModel extends BaseViewModel {
  final NavigationService navigationService = locator<NavigationService>();

  int? _selectedIndex = 0;

  int? get selectedIndex => _selectedIndex;

  void onTapNavBar(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  Widget getTab() {
    if (_selectedIndex == 0) {
      return const HomeView();
    } else if (selectedIndex == 1) {
      return const AcademicsView();
    } else if (selectedIndex == 2) {
      return const AttendanceView();
    } else {
      return const ProfileView();
    }
  }
}
