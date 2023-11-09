import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:teacher_cloudschool/ui/components/custom_button.dart';
import 'package:teacher_cloudschool/ui/components/widget_header/widget_header_view.dart';
import 'package:teacher_cloudschool/utils/colors.dart';
import 'package:teacher_cloudschool/utils/sizes/default.dart';

import '../../../components/cs_textfields/custom_textfield_view.dart';
import 'edit_profile_viewmodel.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ViewModelBuilder<EditProfileViewModel>.reactive(
      viewModelBuilder: () => EditProfileViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Edit Profile'),
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
                    header: 'First Name', optionVisible: false),
                CustomTextField(
                    controller: model.firstNameController!,
                    errorTextId: 'firstName',
                    hint: 'Enter your First Name',
                    validationMessage: model.validateFormsKey('firstName'),
                    inputType: TextInputType.text,
                    label: 'First Name'),
                const SizedBox(
                  height: 10,
                ),
                const WidgetHeaderView(
                    header: 'Last Name', optionVisible: false),
                CustomTextField(
                    controller: model.firstNameController!,
                    errorTextId: 'lastName',
                    hint: 'Enter your Last Name',
                    validationMessage: model.validateFormsKey('lastName'),
                    inputType: TextInputType.text,
                    label: 'Last Name'),
                const SizedBox(
                  height: 10,
                ),
                const WidgetHeaderView(header: 'email', optionVisible: false),
                CustomTextField(
                    controller: model.firstNameController!,
                    errorTextId: 'email',
                    hint: 'Enter  email',
                    validationMessage: model.validateFormsKey('email'),
                    inputType: TextInputType.emailAddress,
                    label: 'email'),
                const SizedBox(
                  height: 10,
                ),
                const WidgetHeaderView(
                    header: 'phone Number', optionVisible: false),
                CustomTextField(
                    controller: model.firstNameController!,
                    errorTextId: 'phoneNumber',
                    hint: 'Enter PhoneNumber',
                    validationMessage: model.validateFormsKey('phoneNumber'),
                    inputType: TextInputType.phone,
                    label: 'phoneNumber'),
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
      ),
    );
  }
}
