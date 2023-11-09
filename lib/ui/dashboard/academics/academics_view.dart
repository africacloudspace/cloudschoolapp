import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:teacher_cloudschool/utils/colors.dart';
import 'package:teacher_cloudschool/utils/sizes/default.dart';

import 'academics_viewmodel.dart';

class AcademicsView extends StatelessWidget {
  const AcademicsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AcademicsViewModel>.reactive(
      viewModelBuilder: () => AcademicsViewModel(),
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: Spacing.all(10),
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                SingleRouteOption(
                    callback: () {
                      model.navigateToCBC();
                    },
                    color: Colors.green,
                    subTitle:
                        'With Formative & Summative Assessment, Lesson Plans, Scheme and much more',
                    title: 'Competence Based Curriculum (CBC)',
                    icon: Icons.class_outlined),
                SingleRouteOption(
                    callback: () {
                      model.navigateToCBC();
                    },
                    color: ColorResources.secondaryColor,
                    subTitle:
                        'Manage Exams, enter marks, generate mark sheet, broadsheet, analysis, reports and much more',
                    title: '8-4-4 Curriculum',
                    icon: Icons.class_outlined),
                SingleRouteOption(
                    callback: () {
                      model.navigateToCBC();
                    },
                    color: ColorResources.blueColor,
                    subTitle:
                        'Includes IGCSE with formative assessment and much more',
                    title: 'Cambridge International Curriculum',
                    icon: Icons.class_outlined),
                SingleRouteOption(
                    callback: () {
                      model.navigateToCBC();
                    },
                    color: ColorResources.redColor,
                    subTitle:
                        'A system of education for young children that seeks to develop natural interests and activities',
                    title: 'Montessori Curriculum',
                    icon: Icons.class_outlined),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SingleRouteOption extends StackedHookView<AcademicsViewModel> {
  final String? title;
  final IconData icon;
  final String subTitle;
  final Color? color;
  final VoidCallback callback;

  const SingleRouteOption(
      {super.key,
      required this.subTitle,
      required this.callback,
      required this.title,
      required this.color,
      required this.icon});

  @override
  Widget builder(BuildContext context, AcademicsViewModel model) {
    var theme = Theme.of(context);
    return InkWell(
      onTap: callback,
      child: Card(
        elevation: 0,
        margin: Spacing.fromLTRB(5, 10, 5, 10),
        child: ListTile(
          leading: Container(
            margin: Spacing.all(5),
            padding: Spacing.all(10),
            decoration: BoxDecoration(
              color: color!.withAlpha(40),
              borderRadius: BorderRadius.circular(60),
            ),
            child: Icon(
              icon,
              size: 25,
              color: color!.withAlpha(250),
            ),
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title!,
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: 17,
                ),
              ),
              Text(
                subTitle,
                style: theme.textTheme.bodySmall!
                    .copyWith(fontWeight: FontWeight.w600, fontSize: 10),
              )
            ],
          ),
          trailing: Container(
            margin: Spacing.all(5),
            child: Icon(
              Icons.arrow_forward_ios,
              size: 15,
              color: theme.colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }
}
