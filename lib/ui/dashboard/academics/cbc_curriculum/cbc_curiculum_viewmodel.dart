import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:teacher_cloudschool/app/app.locator.dart';

import '../../../../models/chart_data.dart';
import '../../../../models/per_exam_chartdata.dart';
import '../../../../services/alert_service.dart';
import '../../../../utils/colors.dart';

class CBCCurriculumViewModel extends BaseViewModel {
  final TickerProvider tickerProvider;

  CBCCurriculumViewModel({required this.tickerProvider});

  final NavigationService _navigationService = locator<NavigationService>();
  final AlertService _alertService = locator<AlertService>();
  TextEditingController? _yearController = TextEditingController();

  TextEditingController? get yearController => _yearController;

  TextEditingController? _termController = TextEditingController();

  TextEditingController? get termController => _termController;

  TextEditingController? _examController = TextEditingController();

  TextEditingController? get examController => _examController;

  TabController? _tabController;

  TabController? get tabController => _tabController;

  void initialise(TickerProvider tickerProvider) {
    _tabController = TabController(length: 2, vsync: tickerProvider);
  }

  List summativeOverview = [
    {'icon': MdiIcons.viewList, 'title': 'Total Exams', 'subTitle': '7'},
    {'icon': Icons.check_circle, 'title': 'Assessed Exams', 'subTitle': '7'},
    {'icon': Icons.book, 'title': 'Consolidated', 'subTitle': '1'},
    {'icon': MdiIcons.emoticonHappy, 'title': 'Ordinary', 'subTitle': '6'},
  ];

  List formativeOverview = [
    {'icon': MdiIcons.certificate, 'title': 'Total Strands', 'subTitle': '557'},
    {'icon': Icons.check_circle, 'title': 'Assessed strands', 'subTitle': '24'},
    {'icon': Icons.list_alt, 'title': 'Total SubStrands', 'subTitle': '1132'},
    {'icon': Icons.percent, 'title': 'Assessed SubStrands', 'subTitle': '-'},
  ];

  void showOptions(BuildContext context, Widget widget, Alignment alignment) {
    _alertService.fluidCustomDialog(context, widget, alignment);
  }

  String? _yearSet;

  String? get yearSet => _yearSet;

  set yearSet(String? value) {
    _yearSet = value;
    notifyListeners();
  }

  String? _examSet;

  String? get examSet => _examSet;

  set examSet(String? value) {
    _examSet = value;
    notifyListeners();
  }

  String? _termSet;

  String? get termSet => _termSet;

  set termSEt(String? value) {
    _termSet = value;
    notifyListeners();
  }

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

  List<String> examList = <String>[
    'JESMA',
    'MID-TERM',
    'CAT3',
    'AVERAGE-SCORE',
    'OPENER EXAM'
  ];

  List<ChartSeries<ChartData, String>> getStackedAreaSeries() {
    List<ChartData>? chartData = [
      ChartData('Average Score', 3.0),
      ChartData('End Term', 6.0),
      ChartData('Exam 1', 50.0),
      ChartData('JESMA 2', 24.0)
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

  List<ChartSeries<ChartData2, String>> getStackedColumnSeries() {
    List<ChartData2> chartData = <ChartData2>[
      ChartData2('GRADE 4', 50, 55, 72, 65),
      ChartData2('GRADE 1', 80, 75, 70, 60),
      ChartData2('GRADE 2', 35, 45, 55, 52),
      ChartData2('GRADE 5', 38, 5, 60, 50),
    ];
    return <ChartSeries<ChartData2, String>>[
      StackedColumn100Series<ChartData2, String>(
          dataSource: chartData,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
          xValueMapper: (ChartData2 sales, _) => sales.x,
          yValueMapper: (ChartData2 sales, _) => sales.y1,
          name: 'TERM 1'),
      StackedColumn100Series<ChartData2, String>(
          dataSource: chartData,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
          xValueMapper: (ChartData2 sales, _) => sales.x,
          yValueMapper: (ChartData2 sales, _) => sales.y2,
          name: 'TERM 2'),
      StackedColumn100Series<ChartData2, String>(
          dataSource: chartData,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
          xValueMapper: (ChartData2 sales, _) => sales.x,
          yValueMapper: (ChartData2 sales, _) => sales.y3,
          name: 'TERM 3'),
      // StackedColumn100Series<ChartData2, String>(
      //     dataSource: chartData,
      //     dataLabelSettings: const DataLabelSettings(isVisible: true),
      //     xValueMapper: (ChartData2 sales, _) => sales.x,
      //     yValueMapper: (ChartData2 sales, _) => sales.y3,
      //     name: 'GRADE 5'),
    ];
  }
}
