import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:teacher_cloudschool/utils/colors.dart';
import 'package:teacher_cloudschool/utils/sizes/default.dart';

import '../../utils/images.dart';
import 'dashboardviewmodel.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ViewModelBuilder<DashboardViewModel>.reactive(
      viewModelBuilder: () => DashboardViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          actions: [
            Container(
              margin: Spacing.all(5),
              child: Icon(
                Icons.notifications,
                color: theme.colorScheme.primary,
                size: 24,
              ),
            )
          ],
        ),
        drawer: _buildDrawer(theme, context),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: model.selectedIndex!,
          showSelectedLabels: false,
          showUnselectedLabels: true,
          selectedItemColor: ColorResources.primaryColor.withAlpha(10),
          selectedIconTheme:
              IconThemeData(color: ColorResources.primaryColor.withAlpha(250)),
          unselectedIconTheme:
              const IconThemeData(color: ColorResources.primaryColor),
          unselectedLabelStyle: theme.textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.w600, color: ColorResources.primaryColor),
          selectedLabelStyle: theme.textTheme.bodySmall!
              .copyWith(fontWeight: FontWeight.w800, color: Colors.black),
          items: [
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.home_rounded,
                size: 20,
              ),
              label: "Home",
              activeIcon: Container(
                padding: Spacing.all(5),
                decoration: BoxDecoration(
                    color: ColorResources.primaryColor.withAlpha(30),
                    borderRadius: BorderRadius.circular(30)),
                child: const Icon(
                  Icons.home_rounded,
                  size: 20,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.book,
                size: 20,
              ),
              label: "Academics",
              activeIcon: Container(
                padding: Spacing.all(5),
                decoration: BoxDecoration(
                    color: ColorResources.primaryColor.withAlpha(30),
                    borderRadius: BorderRadius.circular(30)),
                child: const Icon(
                  Icons.book,
                  size: 20,
                ),
              ),
            ),
            BottomNavigationBarItem(
                icon: const Icon(
                  Icons.analytics,
                  size: 20,
                ),
                label: "Attendance",
                activeIcon: Container(
                  padding: Spacing.all(5),
                  decoration: BoxDecoration(
                      color: ColorResources.primaryColor.withAlpha(30),
                      borderRadius: BorderRadius.circular(30)),
                  child: const Icon(
                    Icons.analytics,
                    size: 20,
                  ),
                )),
            BottomNavigationBarItem(
              icon: Icon(
                MdiIcons.faceManProfile,
                size: 20,
              ),
              label: "Profile",
              activeIcon: Container(
                padding: Spacing.all(5),
                decoration: BoxDecoration(
                    color: ColorResources.primaryColor.withAlpha(30),
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  children: [
                    Icon(
                      MdiIcons.faceManProfile,
                      size: 20,
                    ),
                  ],
                ),
              ),
            )
          ],
          onTap: model.onTapNavBar,
        ),
        body: SafeArea(
          child: model.getTab(),
        ),
      ),
    );
  }

  Widget _buildDrawer(ThemeData theme, BuildContext context) {
    return Container(
      margin: Spacing.all(16),
      decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Drawer(
          width: MediaQuery.of(context).size.width * 0.6,
          backgroundColor: theme.cardColor,
          child: Container(
            color: theme.scaffoldBackgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  padding: Spacing.all(10),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        image: AssetImage(Images.cloudSchoolLogo),
                        height: 102,
                        width: 102,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  margin: Spacing.x(20),
                  child: Column(
                    children: [
                      ExpandablePanel(
                        header: Padding(
                          padding: Spacing.all(5),
                          child: Row(
                            children: [
                              Icon(
                                MdiIcons.account,
                                size: 24,
                              ),
                              Spacing.width(16),
                              const Expanded(child: Text('Account')),
                            ],
                          ),
                        ),
                        collapsed: const SizedBox(
                          height: 0,
                        ),
                        expanded: Padding(
                          padding: Spacing.horizontal(10),
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              InkWell(
                                onTap: () {},
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                child: Row(
                                  children: [
                                    Spacing.width(16),
                                    const Expanded(
                                        child: Text('My Notifications')),
                                    Icon(
                                      MdiIcons.chevronRight,
                                      size: 18,
                                      color: theme.colorScheme.onBackground,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              InkWell(
                                onTap: () {},
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                child: Row(
                                  children: [
                                    Spacing.width(16),
                                    const Expanded(child: Text('My TimeTable')),
                                    Icon(
                                      MdiIcons.chevronRight,
                                      size: 18,
                                      color: theme.colorScheme.onBackground,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ExpandablePanel(
                        header: Padding(
                          padding: Spacing.all(5),
                          child: Row(
                            children: [
                              Icon(
                                MdiIcons.book,
                                size: 24,
                              ),
                              Spacing.width(16),
                              const Expanded(child: Text('Academics')),
                            ],
                          ),
                        ),
                        collapsed: const SizedBox(
                          height: 0,
                        ),
                        expanded: Padding(
                          padding: Spacing.horizontal(10),
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              InkWell(
                                onTap: () {},
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                child: Row(
                                  children: [
                                    Spacing.width(16),
                                    const Expanded(
                                        child: Text('My Notifications')),
                                    Icon(
                                      MdiIcons.chevronRight,
                                      size: 18,
                                      color: theme.colorScheme.onBackground,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              InkWell(
                                onTap: () {},
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                child: Row(
                                  children: [
                                    Spacing.width(16),
                                    const Expanded(child: Text('My TimeTable')),
                                    Icon(
                                      MdiIcons.chevronRight,
                                      size: 18,
                                      color: theme.colorScheme.onBackground,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ExpandablePanel(
                        header: Padding(
                          padding: Spacing.all(5),
                          child: Row(
                            children: [
                              Icon(
                                MdiIcons.school,
                                size: 24,
                              ),
                              Spacing.width(16),
                              const Expanded(child: Text('Attendance')),
                            ],
                          ),
                        ),
                        collapsed: const SizedBox(
                          height: 0,
                        ),
                        expanded: Padding(
                          padding: Spacing.horizontal(10),
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              InkWell(
                                onTap: () {},
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                child: Row(
                                  children: [
                                    Spacing.width(16),
                                    const Expanded(
                                        child: Text('My Notifications')),
                                    Icon(
                                      MdiIcons.chevronRight,
                                      size: 18,
                                      color: theme.colorScheme.onBackground,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              InkWell(
                                onTap: () {},
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                child: Row(
                                  children: [
                                    Spacing.width(16),
                                    const Expanded(child: Text('My TimeTable')),
                                    Icon(
                                      MdiIcons.chevronRight,
                                      size: 18,
                                      color: theme.colorScheme.onBackground,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ExpandablePanel(
                        header: Padding(
                          padding: Spacing.all(5),
                          child: Row(
                            children: [
                              Icon(
                                MdiIcons.laptop,
                                size: 24,
                              ),
                              Spacing.width(16),
                              const Expanded(child: Text('Online Learning')),
                            ],
                          ),
                        ),
                        collapsed: const SizedBox(
                          height: 0,
                        ),
                        expanded: Padding(
                          padding: Spacing.horizontal(10),
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              InkWell(
                                onTap: () {},
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                child: Row(
                                  children: [
                                    Spacing.width(16),
                                    const Expanded(
                                        child: Text('My Notifications')),
                                    Icon(
                                      MdiIcons.chevronRight,
                                      size: 18,
                                      color: theme.colorScheme.onBackground,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              InkWell(
                                onTap: () {},
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                child: Row(
                                  children: [
                                    Spacing.width(16),
                                    const Expanded(child: Text('My TimeTable')),
                                    Icon(
                                      MdiIcons.chevronRight,
                                      size: 18,
                                      color: theme.colorScheme.onBackground,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
