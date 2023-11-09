import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:teacher_cloudschool/ui/dashboard/profile/preferences/preferences_viewmodel.dart';
import 'package:teacher_cloudschool/utils/sizes/default.dart';

class PreferencesView extends StatelessWidget {
  const PreferencesView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ViewModelBuilder<PreferencesViewModel>.reactive(
      viewModelBuilder: () => PreferencesViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Preferences'),
        ),
        body: SafeArea(
          child: Padding(
            padding: Spacing.all(10),
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                const SizedBox(
                  height: 20,
                ),
                ThemeToggleWidget(
                    icon: MdiIcons.themeLightDark,
                    subtitle: 'Light/ Dark Themes',
                    title: 'Theme'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ThemeToggleWidget extends StackedHookView<PreferencesViewModel> {
  final IconData icon;
  final String? title;
  final String? subtitle;
  final VoidCallback? func;

  const ThemeToggleWidget(
      {Key? key,
      this.func,
      required this.icon,
      required this.subtitle,
      required this.title})
      : super(key: key);

  @override
  Widget builder(BuildContext context, PreferencesViewModel model) {
    var theme = Theme.of(context);
    return InkWell(
      onTap: func,
      child: Container(
        margin: Spacing.all(5),
        child: Row(
          children: [
            Container(
              margin: Spacing.right(10),
              padding: Spacing.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: theme.colorScheme.primary.withOpacity(0.3)),
              child: Icon(
                icon,
                color: theme.colorScheme.primary,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title!,
                    style: theme.textTheme.titleMedium!.copyWith(
                        color: theme.colorScheme.onBackground,
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    subtitle!,
                    style: theme.textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: theme.colorScheme.onBackground),
                  ),
                ],
              ),
            ),
            Switch(
              onChanged: (bool value) {
                model.isDarkMode = value;
                model.toggleTheme();
              },
              value: model.isDarkMode,
              activeColor: theme.colorScheme.primary,
            )
          ],
        ),
      ),
    );
  }
}
