import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:teacher_cloudschool/app/app.locator.dart';
import 'package:teacher_cloudschool/models/event.dart';
import 'package:teacher_cloudschool/utils/colors.dart';

import '../../../models/chart_data.dart';

class HomeViewModel extends BaseViewModel {
  final NavigationService navigationService = locator<NavigationService>();

  ValueNotifier<List<Event>>? _selectedEvents;

  ValueNotifier<List<Event>>? get selectedEvents => _selectedEvents;

  CalendarFormat? _calendarFormat = CalendarFormat.week;

  CalendarFormat? get calendarFormat => _calendarFormat;

  // RangeSelectionMode? _rangeSelectionMode = RangeSelectionMode
  //     .toggledOff;
  //
  // RangeSelectionMode? get rangeSelectionMode = _rangeSelectionMode;

  TextEditingController? _yearController = TextEditingController();

  TextEditingController? get yearController => _yearController;

  TextEditingController? _termController = TextEditingController();

  TextEditingController? get termController => _termController;

  DateTime? _focusedDay = DateTime.now();

  DateTime? get focusedDay => _focusedDay;

  DateTime? _selectedDay;

  DateTime? get selectedDay => _selectedDay;

  DateTime? _rangeStart;

  DateTime? get rangeStart => _rangeStart;

  DateTime? _rangeEnd;

  DateTime? get rangeEnd => _rangeEnd;

  List<String> yearList = <String>[
    '2020',
    '2021',
    '2022',
    '2023',
    '2024',
    '2025',
    '2026',
    '2027',
    '2028',
    '2029',
    '2030',
    '2031',
    '2032'
  ];

  List<String> termsList = <String>['Term 1', 'Term 2', 'Term 3'];

  String? _year;

  String? get year => _year;

  set year(String? value) {
    _year = value;
    notifyListeners();
  }

  String? _term;

  String? get term => _term;

  set term(String? value) {
    _term = value;
    notifyListeners();
  }

  // set calendarFormat(CalendarFormat? format) {
  //   _calendarFormat = format;
  //   notifyListeners();
  // }
  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
      _rangeStart = null; // Important to clean those
      _rangeEnd = null;
      _selectedEvents!.value = getEventsForDay(selectedDay);
      notifyListeners();
    }
  }

  List<Event> getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  List<Event> getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ...getEventsForDay(d),
    ];
  }

  void onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    _selectedDay = null;
    _focusedDay = focusedDay;
    _rangeStart = start;
    _rangeEnd = end;
    notifyListeners();

    // `start` or `end` could be null
    if (start != null && end != null) {
      _selectedEvents!.value = getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents!.value = getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents!.value = getEventsForDay(end);
    }
  }

  void changeCalendarFormat(CalendarFormat? format, CalendarFormat? formatSet) {
    if (formatSet != format) {
      formatSet = format;
    }
    notifyListeners();
  }

  void initialise() {
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(getEventsForDay(_selectedDay!));
    notifyListeners();
  }

  List<ChartSeries<ChartData, String>> getStackedAreaColumnSeries() {
    List<ChartData>? chartData = [
      ChartData('Parents', 100.0),
      ChartData('Teacher', 78.0),
    ];

    return <ChartSeries<ChartData, String>>[
      ColumnSeries<ChartData, String>(
          dataSource: chartData,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          name: 'Diaries',
          color: ColorResources.secondaryColor)
    ];
  }

  List<ChartSeries<ChartData, String>> getStackedAreaSeries() {
    List<ChartData>? chartData = [
      ChartData('Grade 3', 3.0),
      ChartData('Grade 5', 6.0),
      ChartData('Grade 8', 50.0),
      ChartData('Grade 2', 24.0)
    ];
    return <ChartSeries<ChartData, String>>[
      StackedAreaSeries(
        animationDuration: 1000,
        dataSource: chartData,
        color: ColorResources.primaryColor,
        borderColor: ColorResources.cardOrangeColor,
        isVisibleInLegend: false,
        enableTooltip: true,
        xValueMapper: (ChartData sales, _) => sales.x,
        yValueMapper: (ChartData sales, _) => sales.y,
      ),
    ];
  }
}
