import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:teacher_cloudschool/ui/components/cloudschool_dropdown/cs_dropdown_view.dart';
import 'package:teacher_cloudschool/ui/components/widget_header/widget_header_view.dart';
import 'package:teacher_cloudschool/utils/colors.dart';
import 'package:teacher_cloudschool/models/event.dart';
import '../../../utils/sizes/default.dart';
import 'home_viewmodel.dart';
import 'package:syncfusion_flutter_charts/charts.dart' as syncFussion;

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onViewModelReady: (model) => model.initialise(),
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: Spacing.all(10),
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                Container(
                  margin: Spacing.all(10),
                  alignment: Alignment.center,
                  child: Text(
                    'Welcome Back, John Doe',
                    style: theme.textTheme.titleLarge!
                        .copyWith(fontWeight: FontWeight.w700, fontSize: 25),
                  ),
                ),
                SizedBox(
                  child: ListTile(
                    leading: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: CustomDropDown(
                          items: model.yearList,
                          searchController: model.yearController,
                          searchHint: 'YEAR'),
                    ),
                    title: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: CustomDropDown(
                          items: model.termsList,
                          searchController: model.termController,
                          searchHint: 'TERM'),
                    ),
                  ),
                ),
                // const WidgetHeaderView(header: 'Year', optionVisible: false),
                // Container(
                //   padding: Spacing.all(2),
                //   margin: Spacing.vertical(5),
                //   decoration: BoxDecoration(color: theme.cardColor),
                //   child: CustomDropDown(
                //       items: model.yearList,
                //       searchController: model.yearController,
                //       searchHint: 'Select Year'),
                // ),
                // const WidgetHeaderView(header: 'Term', optionVisible: false),
                // Container(
                //   padding: Spacing.all(2),
                //   margin: Spacing.vertical(5),
                //   decoration: BoxDecoration(color: theme.cardColor),
                //   child: CustomDropDown(
                //       items: model.termsList,
                //       searchController: model.termController,
                //       searchHint: 'Select Year'),
                // ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HomeActionCard(
                          callback: () {},
                          icon: MdiIcons.timetable,
                          title: 'Timetable'),
                      HomeActionCard(
                          callback: () {},
                          icon: Icons.book_outlined,
                          title: 'Academics'),
                      HomeActionCard(
                          callback: () {},
                          icon: MdiIcons.crowd,
                          title: 'Class Lists'),
                      HomeActionCard(
                          callback: () {},
                          icon: MdiIcons.abTesting,
                          title: 'Exams'),
                    ],
                  ),
                ),
                const WidgetHeaderView(
                    header: 'My Calendar', optionVisible: true),
                Container(
                  padding: Spacing.all(10),
                  decoration: BoxDecoration(
                    color: ColorResources.cardPestColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Expanded(
                    child: Column(
                      children: [
                        TableCalendar(
                          firstDay: DateTime.utc(2010, 10, 16),
                          lastDay: DateTime.utc(2030, 3, 14),
                          focusedDay: model.focusedDay!,
                          selectedDayPredicate: (day) =>
                              isSameDay(model.selectedDay, day),
                          rangeStartDay: model.rangeStart,
                          rangeEndDay: model.rangeEnd,
                          calendarFormat: model.calendarFormat!,
                          rangeSelectionMode: RangeSelectionMode.toggledOn,
                          eventLoader: model.getEventsForDay,
                          startingDayOfWeek: StartingDayOfWeek.monday,
                          calendarStyle: const CalendarStyle(
                            outsideDaysVisible: false,
                          ),
                          onDaySelected: model.onDaySelected,
                          onRangeSelected: model.onRangeSelected,
                          onFormatChanged: (format) {
                            model.changeCalendarFormat(
                                format, model.calendarFormat);
                          },
                        ),
                        ValueListenableBuilder<List<Event>>(
                          valueListenable: model.selectedEvents!,
                          builder: (context, value, _) {
                            return ListView.builder(
                              itemCount: value.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 12.0,
                                    vertical: 4.0,
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      color: theme.cardColor),
                                  child: ListTile(
                                    onTap: () => debugPrint('${value[index]}'),
                                    title: Text('${value[index]}'),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const WidgetHeaderView(
                    header: 'My Requisitions', optionVisible: true),
                Card(
                  elevation: 0,
                  semanticContainer: true,
                  color: theme.scaffoldBackgroundColor,
                  child: Padding(
                    padding: Spacing.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Card(
                          margin: Spacing.vertical(5),
                          child: Padding(
                            padding: Spacing.all(5),
                            child: ListTile(
                              leading: Container(
                                padding: Spacing.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.blue.shade700.withAlpha(60)),
                                child: Icon(
                                  Icons.list_alt_outlined,
                                  color: Colors.blue.shade700,
                                  size: 24,
                                ),
                              ),
                              title: Text(
                                'Total',
                                style: theme.textTheme.bodyMedium!.copyWith(),
                              ),
                              trailing: Text(
                                '0',
                                style: theme.textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Card(
                          margin: Spacing.vertical(5),
                          child: Padding(
                            padding: Spacing.all(5),
                            child: ListTile(
                              leading: Container(
                                padding: Spacing.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.green.shade700.withAlpha(60)),
                                child: Icon(
                                  Icons.check_circle_outline,
                                  color: Colors.green.shade700,
                                  size: 24,
                                ),
                              ),
                              title: Text(
                                'Approved',
                                style: theme.textTheme.bodyMedium!.copyWith(),
                              ),
                              trailing: Text(
                                '0',
                                style: theme.textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Card(
                          margin: Spacing.vertical(5),
                          child: Padding(
                            padding: Spacing.all(5),
                            child: ListTile(
                              leading: Container(
                                padding: Spacing.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color:
                                        Colors.orange.shade700.withAlpha(60)),
                                child: Icon(
                                  Icons.hourglass_bottom_outlined,
                                  color: Colors.orange.shade700,
                                  size: 24,
                                ),
                              ),
                              title: Text(
                                'Pending',
                                style: theme.textTheme.bodyMedium!.copyWith(),
                              ),
                              trailing: Text(
                                '0',
                                style: theme.textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Card(
                          margin: Spacing.vertical(5),
                          child: Padding(
                            padding: Spacing.all(5),
                            child: ListTile(
                              leading: Container(
                                padding: Spacing.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.red.shade700.withAlpha(60)),
                                child: Icon(
                                  Icons.warning_outlined,
                                  color: Colors.red.shade700,
                                  size: 24,
                                ),
                              ),
                              title: Text(
                                'Denied',
                                style: theme.textTheme.bodyMedium!.copyWith(),
                              ),
                              trailing: Text(
                                '0',
                                style: theme.textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const WidgetHeaderView(
                    header: 'Student Enrollment/Class', optionVisible: true),
                Card(
                  elevation: 0,
                  semanticContainer: true,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Padding(
                      padding: Spacing.all(30),
                      child: syncFussion.SfCartesianChart(
                          plotAreaBorderWidth: 0,
                          title: syncFussion.ChartTitle(
                              text: 'Enrollment/class',
                              textStyle: theme.textTheme.bodySmall!
                                  .copyWith(fontWeight: FontWeight.w900)),
                          legend: const syncFussion.Legend(
                            isVisible: false,
                          ),
                          primaryXAxis: syncFussion.CategoryAxis(),
                          primaryYAxis:
                              syncFussion.NumericAxis(minimum: 0, interval: 10),
                          series: model.getStackedAreaSeries(),
                          tooltipBehavior: syncFussion.TooltipBehavior(
                              enable: true, header: '', canShowMarker: false)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const WidgetHeaderView(
                    header: 'My Diaries', optionVisible: true),
                Card(
                  elevation: 0,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: DefaultTabController(
                      length: 2,
                      child: Column(
                        children: [
                          const TabBar(tabs: [
                            Tab(
                              text: 'Comments',
                            ),
                            Tab(
                              text: 'Summary',
                            )
                          ]),
                          Expanded(
                            child: TabBarView(children: [
                              Padding(
                                padding: Spacing.all(30),
                                child: syncFussion.SfCartesianChart(
                                  plotAreaBorderWidth: 0,
                                  title: syncFussion.ChartTitle(
                                      text: 'My Diaries',
                                      textStyle: theme.textTheme.bodySmall!
                                          .copyWith(
                                              fontWeight: FontWeight.w900)),
                                  legend: const syncFussion.Legend(
                                    isVisible: false,
                                  ),
                                  primaryXAxis: syncFussion.CategoryAxis(),
                                  primaryYAxis: syncFussion.NumericAxis(
                                      minimum: 0, interval: 50),
                                  series: model.getStackedAreaColumnSeries(),
                                  tooltipBehavior: syncFussion.TooltipBehavior(
                                      enable: true,
                                      header: '',
                                      canShowMarker: false),
                                ),
                              ),
                              Padding(
                                padding: Spacing.all(30),
                                child: ListView(
                                  shrinkWrap: true,
                                  children: [
                                    ListTile(
                                      title: Text(
                                        'Total Diaries',
                                        style: theme.textTheme.bodyMedium!
                                            .copyWith(
                                                fontWeight: FontWeight.w800),
                                      ),
                                      trailing: Text(
                                        '100',
                                        style: theme.textTheme.bodyMedium!
                                            .copyWith(
                                                fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                    ListTile(
                                      title: Text(
                                        'Diaries with Teachers comments',
                                        style: theme.textTheme.bodyMedium!
                                            .copyWith(
                                                fontWeight: FontWeight.w800),
                                      ),
                                      trailing: Text(
                                        '78',
                                        style: theme.textTheme.bodyMedium!
                                            .copyWith(
                                                fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                    ListTile(
                                      title: Text(
                                        'Diaries with parent response',
                                        style: theme.textTheme.bodyMedium!
                                            .copyWith(
                                                fontWeight: FontWeight.w800),
                                      ),
                                      trailing: Text(
                                        '100',
                                        style: theme.textTheme.bodyMedium!
                                            .copyWith(
                                                fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeActionCard extends StackedHookView<HomeViewModel> {
  final VoidCallback callback;
  final String? title;
  final IconData? icon;

  const HomeActionCard(
      {super.key,
      required this.callback,
      required this.icon,
      required this.title});

  @override
  Widget builder(BuildContext context, HomeViewModel model) {
    var theme = Theme.of(context);
    return Container(
      margin: Spacing.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: Spacing.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: ColorResources.primaryColor.withAlpha(50)),
            child: Icon(
              icon,
              size: 25,
              color: ColorResources.primaryColor,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title!,
            style: theme.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w800,
            ),
          )
        ],
      ),
    );
  }
}
