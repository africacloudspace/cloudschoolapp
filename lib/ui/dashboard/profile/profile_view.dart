import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:teacher_cloudschool/ui/dashboard/profile/profile_viewmodel.dart';
import 'package:teacher_cloudschool/utils/colors.dart';
import 'package:teacher_cloudschool/utils/sizes/default.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ViewModelBuilder<ProfileViewModel>.reactive(
      viewModelBuilder: () => ProfileViewModel(),
      builder: (context, model, child) => Scaffold(
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
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(
                          'assets/images/profile1.jpg',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'John Doe',
                        style: theme.textTheme.bodyLarge!
                            .copyWith(fontWeight: FontWeight.w800),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          roleType(context, 'Teacher'),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                myStaffOverViewCard(context, '3', '5', '13'),
                const SizedBox(
                  height: 40,
                ),
                const Divider(
                  height: 10,
                  thickness: 0.1,
                  indent: 10,
                  endIndent: 10,
                ),
                singleProfileOption(context, Icons.person, 'Profile',
                    'Edit Profile details', false, () {
                  model.toEditProfile();
                }),
                const Divider(
                  height: 10,
                  thickness: 0.1,
                  indent: 10,
                  endIndent: 10,
                ),
                singleProfileOption(context, Icons.password_outlined,
                    'Password', 'Change Password', false, () {
                  model.toChangePassword();
                }),
                const Divider(
                  height: 10,
                  thickness: 0.1,
                  indent: 10,
                  endIndent: 10,
                ),
                singleProfileOption(context, Icons.settings_outlined,
                    'Preferences', 'Themes, Settings', false, () {
                  model.toPreferences();
                }),
                const Divider(
                  height: 10,
                  thickness: 0.1,
                  indent: 10,
                  endIndent: 10,
                ),
                singleProfileOption(
                    context,
                    Icons.notifications_none_outlined,
                    'Notifications',
                    'Alerts, Reminders, Announcements',
                    false,
                    () {}),
                const Divider(
                  height: 10,
                  thickness: 0.1,
                  indent: 10,
                  endIndent: 10,
                ),
                singleProfileOption(context, Icons.messenger_outline, 'Help',
                    'Contact Us', false, () {}),
                const Divider(
                  height: 10,
                  thickness: 0.1,
                  indent: 10,
                  endIndent: 10,
                ),
                singleProfileOption(context, Icons.help_outline_outlined,
                    'About ', 'About the application', false, () {}),
                const Divider(
                  height: 10,
                  thickness: 0.1,
                  indent: 10,
                  endIndent: 10,
                ),
                singleProfileOption(context, Icons.logout_outlined, 'Log Out',
                    'Exit from your account', true, () {
                  model.logOut();
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget roleType(BuildContext context, String? role) {
  var theme = Theme.of(context);
  return Card(
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
    margin: Spacing.all(10),
    color: ColorResources.secondaryColor,
    child: Padding(
      padding: Spacing.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 8,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.check_circle_outline,
              size: 15,
              color: ColorResources.secondaryColor,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            role!,
            style: theme.textTheme.bodySmall!
                .copyWith(fontWeight: FontWeight.w800, color: Colors.white),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    ),
  );
}

Widget myStaffOverViewCard(BuildContext context, String? totalClasses,
    String? totalStreams, String? totalLessons) {
  var theme = Theme.of(context);
  return Card(
    elevation: 0,
    child: Padding(
      padding: Spacing.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                totalClasses!,
                style: theme.textTheme.bodyMedium!
                    .copyWith(fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Classes',
                style: theme.textTheme.bodySmall!
                    .copyWith(fontWeight: FontWeight.w300, fontSize: 12),
              ),
            ],
          ),
          Container(
            margin: Spacing.horizontal(5),
            height: 40,
            width: 0.7,
            color: Colors.grey,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                totalStreams!,
                style: theme.textTheme.bodyMedium!
                    .copyWith(fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Streams',
                style: theme.textTheme.bodySmall!
                    .copyWith(fontWeight: FontWeight.w300, fontSize: 12),
              ),
            ],
          ),
          Container(
            margin: Spacing.horizontal(5),
            height: 40,
            width: 0.7,
            color: Colors.grey,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                totalLessons!,
                style: theme.textTheme.bodyMedium!
                    .copyWith(fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Lessons',
                style: theme.textTheme.bodySmall!
                    .copyWith(fontWeight: FontWeight.w300, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget singleProfileOption(BuildContext context, IconData icon, String? title,
    String? subTitle, bool isLogOut, VoidCallback callback) {
  var theme = Theme.of(context);
  return InkWell(
    onTap: callback,
    child: SizedBox(
      child: Padding(
        padding: Spacing.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: theme.scaffoldBackgroundColor,
                  child: Icon(
                    icon,
                    size: 24,
                    color: (isLogOut == true)
                        ? ColorResources.redColor
                        : ColorResources.primaryColor,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title!,
                      style: (isLogOut)
                          ? theme.textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w800,
                              color: ColorResources.redColor)
                          : theme.textTheme.bodyMedium!
                              .copyWith(fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      subTitle!,
                      style: (isLogOut == true)
                          ? theme.textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.w300,
                              fontSize: 12,
                              color: ColorResources.redColor)
                          : theme.textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.w300, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
            const Center(
                child: Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ))
          ],
        ),
      ),
    ),
  );
}
