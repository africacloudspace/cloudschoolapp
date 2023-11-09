import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:teacher_cloudschool/ui/components/action_card.dart';
import 'package:teacher_cloudschool/ui/components/cloudschool_dropdown/cs_dropdown_view.dart';
import 'package:teacher_cloudschool/ui/components/custom_arrowbtn.dart';
import 'package:teacher_cloudschool/ui/components/custom_button.dart';
import 'package:teacher_cloudschool/ui/components/widget_header/widget_header_view.dart';
import 'package:teacher_cloudschool/ui/dashboard/academics/cbc_curriculum/cbc_curiculum_viewmodel.dart';
import 'package:teacher_cloudschool/utils/colors.dart';
import 'package:teacher_cloudschool/utils/constants.dart';
import 'package:teacher_cloudschool/utils/sizes/default.dart';
import 'package:syncfusion_flutter_charts/charts.dart' as syncFussion;

class CBCCurriculumView extends StatefulWidget {
  const CBCCurriculumView({super.key});

  @override
  State<CBCCurriculumView> createState() => _CBCCurriculumViewState();
}

class _CBCCurriculumViewState extends State<CBCCurriculumView>
    with TickerProviderStateMixin {
  late TabController _controller;
  final int? _initialIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller =
        TabController(initialIndex: _initialIndex!, length: 2, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ViewModelBuilder<CBCCurriculumViewModel>.reactive(
      viewModelBuilder: () => CBCCurriculumViewModel(tickerProvider: this),
      onViewModelReady: (model) => model.initialise(this),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'CBC Curriculum',
          ),
        ),
        body: SafeArea(
          child: Container(
            margin: Spacing.fromLTRB(10, 20, 10, 10),
            child: ListView(
              shrinkWrap: true,
              children: [
                SizedBox(
                  child: ListTile(
                    leading: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.27,
                      child: CustomDropDown(
                          items: model.yearList,
                          searchController: model.yearController,
                          searchHint: 'YEAR'),
                    ),
                    title: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: CustomDropDown(
                          items: model.termsList,
                          searchController: model.termController,
                          searchHint: 'TERM'),
                    ),
                    trailing: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.29,
                      child: CustomDropDown(
                          items: model.examList,
                          searchController: model.examController,
                          searchHint: 'EXAMS'),
                    ),
                  ),
                ),
                const WidgetHeaderView(
                    header: 'My Overall Class lists', optionVisible: true),
                const ClassList(),
                const WidgetHeaderView(
                    header: 'Strands & SubStrands', optionVisible: true),
                Card(
                  elevation: 0,
                  margin: Spacing.horizontal(5),
                  child: Padding(
                    padding: Spacing.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Manage Strands , SubStrands & Indicators',
                          style: theme.textTheme.bodySmall!
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        CircleAvatar(
                          backgroundColor: theme.scaffoldBackgroundColor,
                          child: const Icon(
                            Icons.arrow_forward,
                            size: 24,
                            color: Colors.white,
                            shadows: kBoxShadowBlack,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const WidgetHeaderView(
                    header: 'Summative/Formative Overview',
                    optionVisible: true),
                Container(
                  margin: Spacing.fromLTRB(20, 10, 20, 0),
                  child: TabBar(controller: _controller, tabs: const [
                    Tab(
                      text: 'Formative',
                    ),
                    Tab(
                      text: 'Summative',
                    )
                  ]),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height + 180,
                  child: TabBarView(controller: _controller, children: const [
                    FormativeView(),
                    SummativeView(),
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ClassList extends StackedHookView<CBCCurriculumViewModel> {
  const ClassList({super.key});

  @override
  Widget builder(BuildContext context, CBCCurriculumViewModel model) {
    var theme = Theme.of(context);
    return Container(
      height: 330,
      margin: Spacing.top(10),
      child: ListView.builder(
          itemCount: 4,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return classListCard(context, 'Grade 3', 'G3', 'EE', '4.0', '-',
                '-', true, true, true, () {}, () {
              model.showOptions(
                  context,
                  analyticsOptions(context, () {}, () {}),
                  Alignment.centerRight);
            }, () {
              model.showOptions(context, assessmentOptions(context, () {}),
                  Alignment.centerRight);
            });
          }),
    );
  }
}

Widget assessmentOptions(BuildContext context, VoidCallback callback) {
  var theme = Theme.of(context);
  return InkWell(
    onTap: callback,
    child: Container(
      padding: Spacing.all(10),
      child: Row(
        children: [
          const Icon(Icons.add),
          Text(
            'Summative Assessment',
            style: theme.textTheme.bodyMedium!
                .copyWith(fontWeight: FontWeight.w900),
          )
        ],
      ),
    ),
  );
}

Widget analyticsOptions(
  BuildContext context,
  VoidCallback callback1,
  VoidCallback callback2,
) {
  var theme = Theme.of(context);
  return SizedBox(
    height: 100,
    child: Column(
      children: [
        InkWell(
          onTap: callback1,
          child: Container(
            padding: Spacing.all(10),
            child: Row(
              children: [
                const Icon(Icons.add),
                Text(
                  'Summative',
                  style: theme.textTheme.bodyMedium!
                      .copyWith(fontWeight: FontWeight.w900),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        InkWell(
          onTap: callback2,
          child: Container(
            padding: Spacing.all(10),
            child: Row(
              children: [
                const Icon(Icons.add),
                Text(
                  'Formative',
                  style: theme.textTheme.bodyMedium!
                      .copyWith(fontWeight: FontWeight.w900),
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

class FormativeView extends StackedHookView<CBCCurriculumViewModel> {
  const FormativeView({super.key});

  @override
  Widget builder(BuildContext context, CBCCurriculumViewModel model) {
    var theme = Theme.of(context);
    return Card(
      elevation: 0,
      child: SizedBox(
        child: Column(
          children: [
            SizedBox(
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: model.formativeOverview.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 2.0,
                      childAspectRatio: 2.5),
                  itemBuilder: (context, index) {
                    return summativeFormativeCard(
                        context,
                        model.formativeOverview[index]['title'],
                        model.formativeOverview[index]['subTitle'],
                        model.formativeOverview[index]['icon'],
                        ColorResources.primaryColor);
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: Spacing.horizontal(10),
              child: const WidgetHeaderView(
                  header: 'Formative Actions', optionVisible: false),
            ),
            SizedBox(
              height: 100,
              child: Padding(
                padding: Spacing.horizontal(10),
                child: ListView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    ActionCard(
                        callback: () {},
                        title: 'Assess Student',
                        color: ColorResources.primaryColor,
                        icon: MdiIcons.faceManProfile),
                    const SizedBox(
                      width: 5,
                    ),
                    ActionCard(
                        callback: () {},
                        title: 'Analytics/Reports',
                        color: ColorResources.primaryColor,
                        icon: MdiIcons.googleAnalytics),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: Spacing.horizontal(10),
              child: const WidgetHeaderView(
                  header: 'School Results', optionVisible: false),
            ),
            const SizedBox(
              height: 5,
            ),
            Card(
              elevation: 0,
              margin: Spacing.horizontal(10),
              color: theme.scaffoldBackgroundColor,
              child: Padding(
                padding: Spacing.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const WidgetHeaderView(
                        header: 'Term 2', optionVisible: false),
                    const SizedBox(
                      height: 5,
                    ),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 2.5,
                      mainAxisSpacing: 2.5,
                      childAspectRatio: 2.5,
                      crossAxisCount: 2,
                      children: [
                        schoolResultsCard(context, ColorResources.primaryColor,
                            Icons.percent, 'Mean Mark', '4'),
                        schoolResultsCard(context, ColorResources.primaryColor,
                            Icons.grade, 'Mean Grade', '-'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: Spacing.horizontal(10),
              child: const WidgetHeaderView(
                  header: 'My Class list', optionVisible: false),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 185,
              child: Card(
                elevation: 0,
                margin: Spacing.horizontal(10),
                color: theme.scaffoldBackgroundColor,
                child: Padding(
                  padding: Spacing.all(5),
                  child: ListView.builder(
                      itemCount: 4,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return classListCard(context, 'Grade 3', 'G3', 'EE',
                            '4.0', 'EE', '4.0', true, false, false, () {}, () {
                          model.showOptions(
                              context,
                              analyticsOptions(context, () {}, () {}),
                              Alignment.centerRight);
                        }, () {
                          model.showOptions(
                              context,
                              assessmentOptions(context, () {}),
                              Alignment.centerRight);
                        });
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SummativeView extends StackedHookView<CBCCurriculumViewModel> {
  const SummativeView({super.key});

  @override
  Widget builder(BuildContext context, CBCCurriculumViewModel model) {
    var theme = Theme.of(context);
    return Card(
      elevation: 0,
      child: SizedBox(
        child: Column(
          children: [
            SizedBox(
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: model.summativeOverview.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 2.0,
                      childAspectRatio: 2.5),
                  itemBuilder: (context, index) {
                    return summativeFormativeCard(
                        context,
                        model.summativeOverview[index]['title'],
                        model.summativeOverview[index]['subTitle'],
                        model.summativeOverview[index]['icon'],
                        ColorResources.secondaryColor);
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: Spacing.horizontal(10),
              child: const WidgetHeaderView(
                  header: 'Summative Actions', optionVisible: false),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 100,
              child: Padding(
                padding: Spacing.horizontal(10),
                child: ListView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    ActionCard(
                        callback: () {},
                        title: 'Manage Exams',
                        color: ColorResources.secondaryColor,
                        icon: MdiIcons.abTesting),
                    const SizedBox(
                      width: 5,
                    ),
                    ActionCard(
                        callback: () {},
                        title: 'Assess Student',
                        color: ColorResources.secondaryColor,
                        icon: MdiIcons.faceManProfile),
                    const SizedBox(
                      width: 5,
                    ),
                    ActionCard(
                        callback: () {},
                        title: 'Assess Exam',
                        color: ColorResources.secondaryColor,
                        icon: MdiIcons.book),
                    const SizedBox(
                      width: 5,
                    ),
                    ActionCard(
                        callback: () {},
                        title: 'Analytics/Reports',
                        color: ColorResources.secondaryColor,
                        icon: MdiIcons.googleAnalytics),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     CustomIconButton(
            //         text: 'Manage Exams',
            //         height: 40,
            //         textColor: Colors.white,
            //         textStyle: theme.textTheme.bodyMedium!
            //             .copyWith(fontSize: 12, color: Colors.white),
            //         icon: Icons.arrow_forward,
            //         callback: () {},
            //         backgroundColor: ColorResources.secondaryColor,
            //         customMargin: 10,
            //         customPadding: 10),
            //     CustomIconButton(
            //         text: 'Assess Student',
            //         height: 40,
            //         textColor: Colors.white,
            //         textStyle: theme.textTheme.bodyMedium!
            //             .copyWith(fontSize: 12, color: Colors.white),
            //         icon: Icons.arrow_forward,
            //         callback: () {},
            //         backgroundColor: ColorResources.secondaryColor,
            //         customMargin: 10,
            //         customPadding: 10),
            //     CustomIconButton(
            //         text: 'Comments',
            //         height: 40,
            //         textColor: Colors.white,
            //         textStyle: theme.textTheme.bodyMedium!
            //             .copyWith(fontSize: 12, color: Colors.white),
            //         icon: Icons.arrow_forward,
            //         callback: () {},
            //         backgroundColor: ColorResources.secondaryColor,
            //         customMargin: 10,
            //         customPadding: 10),
            //     CustomIconButton(
            //         text: 'Assess Now',
            //         height: 40,
            //         textColor: Colors.white,
            //         textStyle: theme.textTheme.bodyMedium!
            //             .copyWith(fontSize: 12, color: Colors.white),
            //         icon: Icons.arrow_forward,
            //         callback: () {},
            //         backgroundColor: ColorResources.secondaryColor,
            //         customMargin: 10,
            //         customPadding: 10),
            //   ],
            // ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: Spacing.horizontal(10),
              child: const WidgetHeaderView(
                  header: 'School Results', optionVisible: false),
            ),
            const SizedBox(
              height: 5,
            ),
            Card(
              elevation: 0,
              margin: Spacing.horizontal(10),
              color: theme.scaffoldBackgroundColor,
              child: Padding(
                padding: Spacing.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const WidgetHeaderView(
                        header: 'Term 2', optionVisible: false),
                    const SizedBox(
                      height: 5,
                    ),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 2.5,
                      mainAxisSpacing: 2.5,
                      childAspectRatio: 2.5,
                      crossAxisCount: 2,
                      children: [
                        schoolResultsCard(
                            context,
                            ColorResources.secondaryColor,
                            Icons.percent,
                            'Mean Mark',
                            '74'),
                        schoolResultsCard(
                            context,
                            ColorResources.secondaryColor,
                            Icons.grade,
                            'Mean Grade',
                            'ME'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: Spacing.horizontal(10),
              child: const WidgetHeaderView(
                  header: 'My Class List', optionVisible: false),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 185,
              child: Card(
                elevation: 0,
                margin: Spacing.horizontal(10),
                color: theme.scaffoldBackgroundColor,
                child: Padding(
                  padding: Spacing.all(5),
                  child: ListView.builder(
                      itemCount: 4,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return classListCard(context, 'Grade 3', 'G3', 'EE',
                            '4.0', '-', '-', false, true, false, () {}, () {
                          model.showOptions(
                              context,
                              analyticsOptions(context, () {}, () {}),
                              Alignment.centerRight);
                        }, () {
                          model.showOptions(
                              context,
                              assessmentOptions(context, () {}),
                              Alignment.centerRight);
                        });
                      }),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: Spacing.horizontal(10),
              child: const WidgetHeaderView(
                  header: 'Graphs Analysis', optionVisible: false),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.34,
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    const TabBar(tabs: [
                      Tab(
                        text: 'Exam',
                      ),
                      Tab(
                        text: 'Exam Per Class',
                      )
                    ]),
                    Expanded(
                      child: TabBarView(children: [
                        Card(
                            elevation: 0,
                            margin: Spacing.horizontal(10),
                            color: theme.scaffoldBackgroundColor,
                            child: examComparativeAnalysis(context, 'Term 3',
                                model.getStackedAreaSeries())),
                        Card(
                            elevation: 0,
                            margin: Spacing.horizontal(10),
                            color: theme.scaffoldBackgroundColor,
                            child: classExamComparativeAnalysis(
                                context, model.getStackedColumnSeries())),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget classExamComparativeAnalysis(BuildContext context, dynamic series) {
  var theme = Theme.of(context);
  return syncFussion.SfCartesianChart(
    plotAreaBorderWidth: 0,
    title: ChartTitle(
        text: 'Class Exam Comparative/Term',
        textStyle:
            theme.textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w800)),
    legend: Legend(
        isVisible: true,
        overflowMode: LegendItemOverflowMode.scroll,
        textStyle: theme.textTheme.bodySmall!.copyWith(fontSize: 12)),
    primaryXAxis: CategoryAxis(
      majorGridLines: const MajorGridLines(width: 0),
    ),
    primaryYAxis: NumericAxis(
        rangePadding: ChartRangePadding.auto,
        axisLine: const AxisLine(width: 0),
        majorTickLines: const MajorTickLines(size: 0)),
    series: series,
    tooltipBehavior:
        TooltipBehavior(enable: true, header: '', canShowMarker: false),
  );
}

Widget examComparativeAnalysis(
    BuildContext context, String? term, dynamic series) {
  var theme = Theme.of(context);
  return Padding(
    padding: Spacing.all(30),
    child: SizedBox(
      height: 200,
      child: syncFussion.SfCartesianChart(
          plotAreaBorderWidth: 0,
          title: syncFussion.ChartTitle(
              text: 'Exam Comparative Analysis ${term!}',
              textStyle: theme.textTheme.bodySmall!
                  .copyWith(fontWeight: FontWeight.w900)),
          legend: const syncFussion.Legend(
            isVisible: false,
          ),
          primaryXAxis: syncFussion.CategoryAxis(),
          primaryYAxis: syncFussion.NumericAxis(minimum: 0, interval: 10),
          series: series,
          tooltipBehavior: syncFussion.TooltipBehavior(
              enable: true, header: '', canShowMarker: false)),
    ),
  );
}

Widget schoolResultsCard(BuildContext context, Color color, IconData icon,
    String? title, String? subTitle) {
  var theme = Theme.of(context);
  return Card(
    elevation: 0,
    child: Padding(
      padding: Spacing.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: color,
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            title!,
            style: theme.textTheme.bodyMedium!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            subTitle!,
            style: theme.textTheme.bodyMedium!
                .copyWith(fontWeight: FontWeight.w800),
          ),
        ],
      ),
    ),
  );
}

Widget summativeFormativeCard(BuildContext context, String? title,
    String subTitle, IconData icon, Color color) {
  var theme = Theme.of(context);
  return Card(
    margin: Spacing.all(5),
    elevation: 0,
    color: theme.scaffoldBackgroundColor,
    child: Padding(
      padding: Spacing.all(10),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color.withAlpha(30),
            child: Icon(
              icon,
              size: 20,
              color: color,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title!,
                maxLines: 3,
                style: theme.textTheme.bodySmall!
                    .copyWith(fontWeight: FontWeight.w500, fontSize: 11),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                subTitle,
                style: theme.textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}

Widget classListCard(
    BuildContext context,
    String? grade,
    String? gradeInitials,
    String? summativeMeanGrade,
    String? summativeMeanMarks,
    String? formativeMeanGrade,
    String? formativeMeanMarks,
    bool? showFormative,
    bool? showSummative,
    bool? showClassListBtn,
    VoidCallback callback1,
    VoidCallback callback2,
    VoidCallback callback3) {
  var theme = Theme.of(context);
  return Card(
    elevation: 0,
    margin: Spacing.all(5),
    child: Padding(
      padding: Spacing.fromLTRB(5, 5, 5, 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    maxRadius: 15,
                    backgroundColor: ColorResources.blueColor,
                    child: Text(
                      gradeInitials!,
                      style: theme.textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w900, color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    grade!.toUpperCase(),
                    style: theme.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w800,
                        color: ColorResources.blueColor),
                  )
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              (showClassListBtn != true)
                  ? const SizedBox.shrink()
                  : CustomIconButton(
                      height: 20,
                      textStyle:
                          theme.textTheme.bodyMedium!.copyWith(fontSize: 12),
                      text: 'Class list',
                      callback: callback1,
                      backgroundColor: theme.scaffoldBackgroundColor,
                      customMargin: 5,
                      icon: Icons.arrow_forward,
                      customPadding: 5)
            ],
          ),
          (showSummative != true)
              ? const SizedBox.shrink()
              : Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: Spacing.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Summative',
                            style: theme.textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w200,
                                color: ColorResources.secondaryColor),
                          ),
                          const Divider(
                            height: 5,
                            indent: 30,
                            endIndent: 30,
                            thickness: 0.5,
                          ),
                          Card(
                            elevation: 0,
                            color: theme.scaffoldBackgroundColor,
                            child: Padding(
                                padding: Spacing.all(5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Opener exam'.toUpperCase(),
                                      style: theme.textTheme.bodySmall!
                                          .copyWith(
                                              color:
                                                  theme.colorScheme.tertiary),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Mean Grade',
                                              style: theme.textTheme.bodySmall!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500),
                                            ),
                                            Text(
                                              'EE'.toUpperCase(),
                                              style: theme.textTheme.bodyMedium!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w800),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 30,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Mean Marks',
                                              style: theme.textTheme.bodySmall!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500),
                                            ),
                                            Text(
                                              '4.0'.toUpperCase(),
                                              style: theme.textTheme.bodyMedium!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w800),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                )),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
          (showFormative != true)
              ? const SizedBox.shrink()
              : Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: Spacing.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Formative',
                            style: theme.textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w200,
                                color: ColorResources.primaryColor),
                          ),
                          const Divider(
                            height: 5,
                            indent: 30,
                            endIndent: 30,
                            thickness: 0.5,
                          ),
                          Card(
                            elevation: 0,
                            color: theme.scaffoldBackgroundColor,
                            child: Padding(
                              padding: Spacing.all(5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Text(
                                  //   'Opener exam'.toUpperCase(),
                                  //   style: theme.textTheme.bodySmall!
                                  //       .copyWith(
                                  //           color: theme.colorScheme.primary),
                                  // ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Mean Grade',
                                            style: theme.textTheme.bodySmall!
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.w500),
                                          ),
                                          Text(
                                            '-'.toUpperCase(),
                                            style: theme.textTheme.bodyMedium!
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.w800),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 30,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Mean Marks',
                                            style: theme.textTheme.bodySmall!
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.w500),
                                          ),
                                          Text(
                                            '-'.toUpperCase(),
                                            style: theme.textTheme.bodyMedium!
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.w800),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
          (showClassListBtn != true)
              ? const SizedBox.shrink()
              : InkWell(
                  onTap: callback2,
                  child: Container(
                    margin: Spacing.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: Spacing.vertical(0),
                          padding: Spacing.all(5),
                          decoration: BoxDecoration(
                            color: ColorResources.blueColor,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Assessments',
                                style: theme.textTheme.bodySmall!.copyWith(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 10,
                                    color: Colors.white),
                              ),
                              const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        InkWell(
                          onTap: callback3,
                          child: Container(
                            margin: Spacing.all(0),
                            padding: Spacing.all(5),
                            decoration: BoxDecoration(
                              color: ColorResources.blueColor,
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Analytics',
                                  style: theme.textTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 10,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    ),
  );
}
