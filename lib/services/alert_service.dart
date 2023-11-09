import 'package:fluid_dialog/fluid_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'package:stacked_services/stacked_services.dart';
import 'package:teacher_cloudschool/utils/colors.dart';

import '../app/app.locator.dart';
import '../utils/constants.dart';

class AlertService {
  final NavigationService _navigationService = locator<NavigationService>();

  void _closeAlertDialogue() {
    _navigationService.popRepeated(1);
  }

  void messageDialogNetwork(
    BuildContext context,
    String message,
    String buttonText,
    Function callback,
    IconData icon,
    Color color,
  ) {
    var messageContent = SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            shadows: kBoxShadowBlack,
            color: color,
            size: 80,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          const SizedBox(
            height: 10,
          ),
          // Container(
          //   margin: Spacing.zero,
          //   width: MediaQuery.of(context).size.width,
          //   child: RoundedButton(
          //     color: Theme.of(context).colorScheme.primary,
          //     textColor: Colors.white,
          //     text: buttonText,
          //     onPressed: () {
          //       if (callback != null) {
          //         callback.call();
          //       } else {
          //         locator<NavigationService>().popRepeated(1);
          //       }
          //     },
          //   ),
          // )
        ],
      ),
    );
    Alert(
        context: context,
        onWillPopActive: true,
        content: messageContent,
        type: AlertType.none,
        style: AlertStyle(
          animationType: AnimationType.grow,
          animationDuration: const Duration(milliseconds: 100),
          isButtonVisible: false,
          isCloseButton: true,
          isOverlayTapDismiss: false,
          backgroundColor: Theme.of(context).dialogTheme.backgroundColor,
        )).show();
  }

  void fluidCustomDialog(
      BuildContext context, Widget widget, Alignment alignment) {
    showDialog(
      context: context,
      builder: (context) => FluidDialog(
        rootPage: FluidDialogPage(
          alignment: alignment,
          builder: (context) => widget,
        ),
      ),
    );
  }

  void messageDialog(BuildContext context, String message, String buttonText,
      VoidCallback? callback, AlertType alertType, Color color) {
    var messageContent = const SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     IconButton(
          //       onPressed: _closeAlertDialogue,
          //       icon: const Icon(
          //         MdiIcons.close,
          //         color: kPrimaryColor,
          //       ),
          //     )
          //   ],
          // ),
          // Icon(
          //   icon,
          //   color: color,
          //   size: 60,
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          // Text(
          //   message,
          //   textAlign: TextAlign.center,
          //   style: const TextStyle(
          //     fontWeight: FontWeight.normal,
          //     fontSize: 14.0,
          //   ),
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          // Container(
          //   width: MediaQuery.of(context).size.width,
          //   margin: Spacing.zero,
          //   child: RoundedButton(
          //     color: kPrimaryColor,
          //     textColor: kSecondaryColor,
          //     text: buttonText,
          //     onPressed: () {
          //       if (callback != null) {
          //         callback.call();
          //       } else {
          //         locator<NavigationService>().popRepeated(1);
          //       }
          //     },
          //   ),
          // )
        ],
      ),
    );
    Alert(
        context: context,
        onWillPopActive: true,
        desc: message,
        content: messageContent,
        type: alertType,
        buttons: [
          DialogButton(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.65,
            radius: BorderRadius.circular(10),
            margin: const EdgeInsets.all(0),
            splashColor: Theme.of(context).splashColor,
            color: ColorResources.primaryColor,
            padding: const EdgeInsets.all(3),
            child: Text(
              buttonText.tr,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: ColorResources.secondaryColor),
            ),
            onPressed: () {
              if (callback != null) {
                callback.call();
              } else {
                locator<NavigationService>().popRepeated(1);
              }
            },
          ),
        ],
        style: AlertStyle(
          animationType: AnimationType.fromBottom,
          animationDuration: const Duration(milliseconds: 100),
          alertAlignment: Alignment.center,
          isButtonVisible: true,
          isCloseButton: true,
          isOverlayTapDismiss: true,
          descTextAlign: TextAlign.center,
          descStyle: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
          descPadding: const EdgeInsets.only(top: 20, bottom: 10),
          backgroundColor: Theme.of(context).dialogTheme.backgroundColor,
        )).show();
  }

  void customDialog(
      BuildContext context, Widget widget, VoidCallback callback) {
    var theme = Theme.of(context);
    var messageContent = widget;
    Alert(
        context: context,
        onWillPopActive: true,
        content: messageContent,
        closeFunction: callback,
        padding: const EdgeInsets.all(3),
        closeIcon: Icon(
          Icons.close,
          size: 15,
          color: theme.colorScheme.onBackground,
        ),
        type: AlertType.none,
        style: AlertStyle(
          animationType: AnimationType.fromBottom,
          animationDuration: const Duration(milliseconds: 100),
          isButtonVisible: false,
          isCloseButton: true,
          isOverlayTapDismiss: false,
          backgroundColor: Theme.of(context).dialogTheme.backgroundColor,
        )).show();
  }

// void queryDialog(BuildContext context, String message, String secondQuery,
//     String firstQuery, VoidCallback? callback, IconData icon, Color color) {
//   var messageContent = SizedBox(
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             IconButton(
//                 onPressed: _closeAlertDialogue,
//                 icon: const Icon(
//                   Icons.close_rounded,
//                   color: kPrimaryColor,
//                 ))
//           ],
//         ),
//         Icon(
//           icon,
//           color: color,
//           size: 60,
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         Text(
//           message,
//           style:
//           const TextStyle(fontWeight: FontWeight.normal, fontSize: 14.0),
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             OptionRoundedButton(
//               color: kPrimaryColor,
//               textColor: kSecondaryColor,
//               text: secondQuery,
//               onPressed: () {
//                 locator<NavigationService>().popRepeated(1);
//               },
//             ),
//             OptionRoundedButton(
//               color: kPrimaryColor,
//               textColor: kSecondaryColor,
//               text: firstQuery,
//               onPressed: () {
//                 if (callback != null) {
//                   callback.call();
//                 } else {
//                   locator<NavigationService>().popRepeated(1);
//                 }
//               },
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
//   Alert(
//       context: context,
//       onWillPopActive: true,
//       content: messageContent,
//       type: AlertType.none,
//       style: AlertStyle(
//         animationType: AnimationType.fromBottom,
//         animationDuration: const Duration(milliseconds: 100),
//         isButtonVisible: false,
//         isCloseButton: false,
//         isOverlayTapDismiss: false,
//         backgroundColor: Theme.of(context).dialogTheme.backgroundColor,
//       )).show();
// }
}
