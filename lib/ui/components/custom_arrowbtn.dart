import 'package:flutter/material.dart';
import 'package:teacher_cloudschool/utils/sizes/default.dart';

class CustomIconButton extends StatelessWidget {
  final double customMargin;
  final double customPadding;
  final String? text;
  final Color? backgroundColor;
  final Color? textColor;
  final VoidCallback callback;
  final IconData icon;
  final double height;
  final TextStyle textStyle;

  const CustomIconButton(
      {super.key,
        required this.textStyle,
      required this.height,
      required this.text,
      this.textColor,
      required this.icon,
      required this.callback,
      required this.backgroundColor,
      required this.customMargin,
      required this.customPadding});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      onTap: callback,
      child: Container(
        margin: Spacing.all(customMargin),
        padding: Spacing.horizontal(customPadding),
        height: height,
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text!,
              style:textStyle,
            ),
            const SizedBox(
              width: 5,
            ),
            Icon(
              icon,
              size: 15,
              color: textColor,
            )
          ],
        ),
      ),
    );
  }
}
