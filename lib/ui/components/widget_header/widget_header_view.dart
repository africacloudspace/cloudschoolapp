import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:teacher_cloudschool/ui/components/widget_header/widget_header_viewmodel.dart';
import 'package:teacher_cloudschool/utils/colors.dart';
import 'package:teacher_cloudschool/utils/sizes/default.dart';

class WidgetHeaderView extends StatelessWidget {
  final bool? optionVisible;
  final String? header;
  final VoidCallback? callback;

  const WidgetHeaderView(
      {super.key,
      required this.header,
      required this.optionVisible,
      this.callback});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ViewModelBuilder<WidgetHeaderViewModel>.reactive(
      viewModelBuilder: () => WidgetHeaderViewModel(),
      builder: (context, model, child) => Container(
        padding: Spacing.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              header!.toUpperCase(),
              style: theme.textTheme.bodySmall!.copyWith(
                fontSize: 10,
                fontWeight: FontWeight.w800,
              ),
            ),
            (optionVisible != true)
                ? const SizedBox.shrink()
                : InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.more_horiz,
                      size: 15,
                      color: theme.primaryColor,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
