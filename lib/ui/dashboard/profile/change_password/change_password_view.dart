import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:teacher_cloudschool/ui/components/cs_textfields/custom_password_field.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/sizes/default.dart';
import '../../../components/cs_textfields/custom_textfield_view.dart';
import '../../../components/custom_button.dart';
import '../../../components/widget_header/widget_header_view.dart';
import 'change_password_viewmodel.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChangePasswordViewModel>.reactive(
        viewModelBuilder: () => ChangePasswordViewModel(),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text('Change Password'),
              ),
              body: SafeArea(
                child: Padding(
                  padding: Spacing.all(20),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const WidgetHeaderView(
                          header: 'Previous Password', optionVisible: false),
                      CustomPasswordTextField(
                          errorTextId: 'previousPassword',
                          inputType: TextInputType.visiblePassword,
                          label: 'Previous Password',
                          hint: 'Enter Previous Password',
                          controller: model.previousPasswordController!,
                          validationMessage:
                              model.validateFormsKey('previous')),
                      const SizedBox(
                        height: 10,
                      ),
                      const WidgetHeaderView(
                          header: 'New Password', optionVisible: false),
                      CustomPasswordTextField(
                          errorTextId: 'confirmPassword',
                          inputType: TextInputType.visiblePassword,
                          label: 'Confirm Password',
                          hint: 'Enter Password',
                          controller: model.confirmPasswordController!,
                          validationMessage: model.validateFormsKey('confirm')),
                      const SizedBox(
                        height: 10,
                      ),
                      const WidgetHeaderView(
                          header: 'Confirm Password', optionVisible: false),
                      CustomPasswordTextField(
                          errorTextId: 'previousPassword',
                          inputType: TextInputType.visiblePassword,
                          label: 'Previous Password',
                          hint: 'Enter Previous Password',
                          controller: model.previousPasswordController!,
                          validationMessage:
                              model.validateFormsKey('previous')),
                      const SizedBox(
                        height: 50,
                      ),
                      CustomSmallButton(
                          backgroundColor: ColorResources.primaryColor,
                          onTap: () {
                            model.submit();
                          },
                          text: 'Submit',
                          isLoading: false,
                          textColor: Colors.white)
                    ],
                  ),
                ),
              ),
            ));
  }
}
