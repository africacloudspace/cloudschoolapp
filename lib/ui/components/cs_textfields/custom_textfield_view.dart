import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../utils/sizes/default.dart';
import 'custom_textfield_viewmodel.dart';

class CustomTextField extends StatelessWidget {
  final String? hint;
  final String? label;
  final TextEditingController controller;
  final String? validationMessage;
  final TextInputType inputType;
  final String? errorTextId;

  const CustomTextField(
      {super.key,
      required this.controller,
      required this.errorTextId,
      required this.hint,
      required this.validationMessage,
      required this.inputType,
      required this.label});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ViewModelBuilder<CustomTextFieldViewModel>.reactive(
      viewModelBuilder: () => CustomTextFieldViewModel(),
      builder: (context, model, child) => Container(
        margin: Spacing.top(0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 5, bottom: 5),
          child: TextFormField(
            enabled: true,
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
      ),
    );
  }
}
