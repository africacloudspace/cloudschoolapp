import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:teacher_cloudschool/ui/components/custom_button.dart';
import 'package:teacher_cloudschool/ui/splash_screen/splash_screen_viewmodel.dart';
import 'package:teacher_cloudschool/utils/colors.dart';
import 'package:teacher_cloudschool/utils/images.dart';
import 'package:teacher_cloudschool/utils/sizes/default.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ViewModelBuilder<SplashScreenViewModel>.reactive(
        viewModelBuilder: () => SplashScreenViewModel(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: ColorResources.primaryColor,
              body: SafeArea(
                  child: Padding(
                padding: Spacing.all(20),
                child: ListView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Container(
                      padding: Spacing.all(10),
                      margin: Spacing.vertical(20),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset(
                        Images.splash,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Text(
                      'Do More With Cloud School Sytem'.tr,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w800, color: Colors.white),
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.3,
                      height: 30,
                      indent: 30,
                      endIndent: 30,
                    ),
                    Text(
                      'Easy | Intuitive | Modern |'.tr,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodySmall!
                          .copyWith(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomSmallButton(
                        backgroundColor: ColorResources.secondaryColor,
                        onTap: () {
                          model.toLoginUserName();
                        },
                        text: 'Get Started',
                        isLoading: false,
                        textColor: ColorResources.primaryColor)
                  ],
                ),
              )),
            ));
  }
}
