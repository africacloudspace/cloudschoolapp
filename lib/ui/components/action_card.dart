import 'package:flutter/material.dart';

import '../../utils/sizes/default.dart';

class ActionCard extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final VoidCallback callback;
  final Color? color;

  const ActionCard(
      {super.key,
      required this.callback,
      required this.title,
      required this.color,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      margin: Spacing.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: Spacing.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: color!.withAlpha(50)),
            child: Icon(
              icon,
              size: 25,
              color: color,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title!,
            style: theme.textTheme.bodySmall!.copyWith(fontSize: 12),
          )
        ],
      ),
    );
  }
}
