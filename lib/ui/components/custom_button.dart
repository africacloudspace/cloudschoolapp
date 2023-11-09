import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../utils/sizes/dimensions.dart';

class CustomSmallButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color textColor;
  final double textSize;
  final bool? isLoading;
  final bool? showArrow;

  const CustomSmallButton({
    super.key,
    required this.backgroundColor,
    required this.onTap,
    this.showArrow,
    required this.text,
    required this.isLoading,
    required this.textColor,
    this.textSize = Dimensions.FONT_SIZE_LARGE,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(
            vertical: Dimensions.PADDING_SIZE_DEFAULT),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.RADIUS_SIZE_SMALL),
        ),
      ),
      child: (isLoading == true)
          ? SpinKitThreeBounce(
              color: theme.textTheme.bodyLarge!.color!,
              size: 15,
            )
          : (showArrow == true)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      text,
                      style: theme.textTheme.bodyLarge!.copyWith(
                        color: textColor,
                        fontWeight: FontWeight.w400,
                        fontSize: textSize,
                      ),
                    ),
                    const CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Icon(
                        Icons.arrow_forward,
                        size: 24,
                        color: Colors.white,
                      ),
                    )
                  ],
                )
              : Text(
                  text,
                  style: theme.textTheme.bodyLarge!.copyWith(
                    color: textColor,
                    fontWeight: FontWeight.w400,
                    fontSize: textSize,
                  ),
                ),
    );
  }
//Dimensions.FONT_SIZE_EXTRA_LARGE
}
