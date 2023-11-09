import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

import '../../../utils/sizes/default.dart';
import 'cs_dropdown_viewmodel.dart';

class CustomDropDown extends StatelessWidget {
  final List<String>? items;
  final String? searchHint;
  final TextEditingController? searchController;

  const CustomDropDown(
      {super.key,
      required this.items,
      required this.searchController,
      required this.searchHint});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CustomDropDownViewModel(),
      builder: (context, model, child) => Container(
        margin: Spacing.vertical(5),
        child: CustomDropdown.search(
          hintText: searchHint,
          items: items,
          onChanged: (value) {},
          borderRadius: BorderRadius.circular(0),
          selectedStyle:
              theme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w900),
          fillColor: theme.cardColor,
          controller: searchController!,
        ),
      ),
    );
  }
}
