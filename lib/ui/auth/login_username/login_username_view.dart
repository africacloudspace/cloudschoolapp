import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:teacher_cloudschool/ui/components/cs_textfields/custom_textfield_view.dart';
import 'package:teacher_cloudschool/ui/components/custom_button.dart';
import 'package:teacher_cloudschool/utils/sizes/default.dart';

import '../../../utils/colors.dart';
import '../../../utils/images.dart';
import 'login_username_viewmodel.dart';

class LoginUserNameView extends StatelessWidget {
  const LoginUserNameView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ViewModelBuilder<LoginUserNameViewModel>.reactive(
      viewModelBuilder: () => LoginUserNameViewModel(),
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
                const SizedBox(
                  height: 10,
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
                CustomTextField(
                    controller: model.userNameController!,
                    errorTextId: 'userName',
                    hint: 'Enter your Email or Mobile',
                    validationMessage: model.validateFormsKey('userName'),
                    inputType: TextInputType.text,
                    label: 'User Name'),
                const SizedBox(
                  height: 30,
                ),
                CustomSmallButton(
                    backgroundColor: ColorResources.primaryColor,
                    onTap: () {
                      model.toLoginPassword(model.userNameController!.text);
                    },
                    text: 'Proceed'.tr,
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
