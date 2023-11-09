import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

import '../../../utils/colors.dart';
import '../../../utils/images.dart';
import '../../../utils/sizes/default.dart';
import '../../components/cs_textfields/custom_textfield_view.dart';
import '../../components/custom_button.dart';
import 'forgot_password_viewmodel.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ViewModelBuilder<ForgotPasswordViewModel>.reactive(
      viewModelBuilder: () => ForgotPasswordViewModel(),
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
                    height: 100,
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
                  'Forgot Password'.tr,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodySmall!
                      .copyWith(color: ColorResources.primaryColor),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  '(If you do not have an account number ,please contact admin)',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.w900),
                ),
                CustomTextField(
                    controller: model.accountNoController!,
                    errorTextId: 'AccountNo',
                    hint: 'Enter your School account no',
                    validationMessage: model.validateForm('accountNo'),
                    inputType: TextInputType.text,
                    label: 'School Account no.'),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    controller: model.emailController!,
                    errorTextId: ' School Email',
                    hint: 'Enter your School Email',
                    validationMessage: model.validateForm('email'),
                    inputType: TextInputType.emailAddress,
                    label: 'Email'),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    controller: model.phoneController!,
                    errorTextId: 'Phone Number',
                    hint: 'Enter your School Phone Number',
                    validationMessage: model.validateForm('phoneNumber'),
                    inputType: TextInputType.phone,
                    label: 'Phone Number'),
                const SizedBox(
                  height: 30,
                ),
                CustomSmallButton(
                    backgroundColor: ColorResources.primaryColor,
                    onTap: () {
                      model.toPassword(
                          model.accountNoController!.text,
                          model.emailController!.text,
                          model.phoneController!.text);
                    },
                    text: 'Submit'.tr,
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
