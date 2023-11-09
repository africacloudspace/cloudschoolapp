import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stacked/stacked.dart';

import '../../../utils/sizes/default.dart';
import 'custom_password_viewmodel.dart';

class CustomPasswordTextField extends StatelessWidget {
  final String? hint;
  final String? label;
  final TextEditingController controller;
  final String? validationMessage;
  final TextInputType inputType;
  final String? errorTextId;

  const CustomPasswordTextField(
      {super.key,
      required this.errorTextId,
      required this.inputType,
      required this.label,
      required this.hint,
      required this.controller,
      required this.validationMessage});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ViewModelBuilder<CustomPasswordViewModel>.reactive(
        viewModelBuilder: () => CustomPasswordViewModel(),
        builder: (context, model, child) => Container(
              margin: Spacing.top(0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 5, bottom: 5),
                child: TextFormField(
                  enabled: true,
                  obscureText: !model.passwordVisible,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: theme.textTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.w500),
                  keyboardType: inputType,
                  decoration: InputDecoration(
                    hintText: hint,
                    labelText: label,
                    labelStyle: const TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: theme.colorScheme.error),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: InputBorder.none,
                    isDense: true,
                    filled: true,
                    suffixIcon: IconButton(
                      icon: Icon(model.passwordVisible
                          ? MdiIcons.eyeOutline
                          : MdiIcons.eyeOffOutline),
                      onPressed: () {
                        model.passwordVisibility();
                      },
                    ),
                    fillColor: theme.canvasColor,
                    hintStyle: theme.textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: theme.colorScheme.onBackground),
                    contentPadding: Spacing.fromLTRB(10, 10, 10, 10),
                  ),
                  validator: (value) {
                    return model.validate(value, errorTextId);
                  },
                  controller: controller,
                ),
              ),
            ));
  }
}
