import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:teacher_cloudschool/app/app.locator.dart';

import '../../../services/alert_service.dart';

class AttendanceViewModel extends BaseViewModel {
  final NavigationService navigationService = locator<NavigationService>();

  final AlertService _alertService = locator<AlertService>();

  TextEditingController? _gradeController = TextEditingController();

  TextEditingController? get gradeController => _gradeController;

  TextEditingController? _streamController = TextEditingController();

  TextEditingController? get streamController => _streamController;

  List<String> gradeList = <String>['GRADE 3', 'GRADE 1', 'GRADE 4', 'GRADE 6'];
  List<String> streamsList = <String>['YELLOW', 'RED', 'GOLD', 'ORANGE'];

  late String _dateTo = "";

  late String _dateFrom = "";

  String get startDate => _dateFrom;

  String get endDate => _dateTo;

  void setDateFrom(String newDate) {
    _dateFrom = newDate;
    notifyListeners();
  }

  void setDateTo(String newDate) {
    _dateTo = newDate;
    notifyListeners();
  }

  String formatDate(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, "0")}-${date.day
        .toString().padLeft(2, "0")}";
  }

  void submit(BuildContext context) async {
  }

}
