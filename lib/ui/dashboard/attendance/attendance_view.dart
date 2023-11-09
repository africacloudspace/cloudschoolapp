import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_bdaya/flutter_datetime_picker_bdaya.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:teacher_cloudschool/ui/components/widget_header/widget_header_view.dart';
import 'package:teacher_cloudschool/utils/colors.dart';
import 'package:teacher_cloudschool/utils/sizes/default.dart';

import '../../../utils/constants.dart';
import '../../components/cloudschool_dropdown/cs_dropdown_view.dart';
import 'attendance_viewmodel.dart';

class AttendanceView extends StatelessWidget {
  const AttendanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AttendanceViewModel>.reactive(
        viewModelBuilder: () => AttendanceViewModel(),
        builder: (context, model, child) => Scaffold(
              body: SafeArea(
                  child: Padding(
                padding: Spacing.all(10),
                child: ListView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    SizedBox(
                      child: ListTile(
                        leading: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: CustomDropDown(
                              items: model.gradeList,
                              searchController: model.gradeController,
                              searchHint: 'GRADE'),
                        ),
                        title: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: CustomDropDown(
                              items: model.streamsList,
                              searchController: model.streamController,
                              searchHint: 'STREAM'),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 0,
                      margin: Spacing.horizontal(10),
                      child: Padding(
                        padding: Spacing.all(8),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            WidgetHeaderView(
                                header: 'Filter By Date', optionVisible: false),
                            SizedBox(
                              height: 5,
                            ),
                            FilterByDate(),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      endIndent: 40,
                      indent: 40,
                      thickness: 0.2,
                      height: 25,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const WidgetHeaderView(
                        header: 'Attendance Summary', optionVisible: true),
                    attendanceCard(context, 'Total Students', '0',
                        Icons.group_outlined, ColorResources.primaryColor),
                    attendanceCard(context, 'Present Today', '0',
                        Icons.school_outlined, ColorResources.cardPestColor),
                    attendanceCard(context, 'Absent Today', '0',
                        MdiIcons.emoticonSad, Colors.redAccent),

                    attendanceCard(
                        context,
                        'Late Today',
                        '0',
                        Icons.lock_clock_outlined,
                        ColorResources.cardOrangeColor),
                  ],
                ),
              )),
            ));
  }
}

class FilterByDate extends StackedHookView<AttendanceViewModel> {
  const FilterByDate({super.key});

  @override
  Widget builder(BuildContext context, AttendanceViewModel model) {
    var theme = Theme.of(context);
    return Container(
      margin: Spacing.horizontal(10.0),
      padding: Spacing.fromLTRB(15, 3, 5, 3),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              DatePickerBdaya.showDatePicker(context,
                  showTitleActions: true,
                  minTime: DateTime(2000, 1),
                  maxTime: DateTime.now(), onConfirm: (date) {
                model.setDateFrom(model.formatDate(date));
              }, currentTime: DateTime.now(), locale: LocaleType.en);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Date From",
                      style: theme.textTheme.bodySmall,
                    ),
                    const Icon(
                      Icons.arrow_drop_down,
                    ),
                  ],
                ),
                Text(
                  model.startDate,
                  style: theme.textTheme.bodyMedium!
                      .copyWith(fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
          Container(
            margin: Spacing.horizontal(5),
            height: 40,
            width: 1,
            color: Colors.grey,
          ),
          InkWell(
            onTap: () {
              DatePickerBdaya.showDatePicker(context,
                  showTitleActions: true,
                  minTime: DateTime(2000, 1, 1),
                  maxTime: DateTime.now(), onConfirm: (date) {
                model.setDateTo(model.formatDate(date));
              }, currentTime: DateTime.now(), locale: LocaleType.en);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Date To",
                      style: theme.textTheme.bodySmall,
                    ),
                    const Icon(
                      Icons.arrow_drop_down,
                    ),
                  ],
                ),
                Text(
                  model.endDate,
                  style: theme.textTheme.bodyMedium!
                      .copyWith(fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              model.submit(context);
            },
            child: const CircleAvatar(
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget attendanceCard(BuildContext context, String? title, String? subTitle,
    IconData icon, Color iconColor) {
  var theme = Theme.of(context);
  return Card(
    elevation: 0,
    color: iconColor,
    margin: Spacing.all(8),
    child: Padding(
      padding: Spacing.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: theme.scaffoldBackgroundColor,
            child: Icon(
              icon,
              size: 45,
              color: iconColor,
            ),
          ),
          const SizedBox(
            width: 25,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title!,
                style: theme.textTheme.bodyMedium!
                    .copyWith(fontWeight: FontWeight.w500, color: Colors.white),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                subTitle!,
                style: theme.textTheme.bodyLarge!
                    .copyWith(fontWeight: FontWeight.w800, color: Colors.white),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
