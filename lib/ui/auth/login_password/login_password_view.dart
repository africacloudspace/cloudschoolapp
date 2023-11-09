import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:teacher_cloudschool/ui/components/cs_textfields/custom_password_field.dart';

import '../../../utils/colors.dart';
import '../../../utils/images.dart';
import '../../../utils/sizes/default.dart';
import '../../components/custom_button.dart';
import 'login_password_viewmodel.dart';

class LoginPasswordView extends StatelessWidget {
  const LoginPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ViewModelBuilder<LoginPasswordViewModel>.reactive(
      viewModelBuilder: () => LoginPasswordViewModel(),
      builder: (context, model, child) => Scaffold(
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
                  child: Image.asset(
                    Images.cloudSchoolLogo,
                    fit: BoxFit.contain,
                  ),
                ),
                Text(
                  'Cloud School System'.tr,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w800,
                      color: ColorResources.primaryColor),
                ),
                const Divider(
                  endIndent: 30,
                  indent: 30,
                  color: ColorResources.primaryColor,
                  thickness: 0.1,
                  height: 30,
                ),
                Text(
                  'Staff Login'.tr,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodySmall!
                      .copyWith(color: ColorResources.primaryColor),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomPasswordTextField(
                    controller: model.passwordController!,
                    errorTextId: 'password',
                    hint: 'Enter your password',
                    validationMessage: model.validateFormKey('password'),
                    inputType: TextInputType.visiblePassword,
                    label: 'Password'),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      model.toForgotPassword();
                    },
                    child: Text(
                      'forgot password?',
                      style: theme.textTheme.bodySmall!.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: ColorResources.primaryColor),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomSmallButton(
                    backgroundColor: ColorResources.primaryColor,
                    onTap: () {
                      model.toDashboard(model.passwordController!.text);
                    },
                    text: 'Login'.tr,
                    isLoading: false,
                    textColor: ColorResources.secondaryColor)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
