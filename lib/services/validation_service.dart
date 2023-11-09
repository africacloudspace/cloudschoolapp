import 'package:flutter/widgets.dart';
import 'package:libphonenumber/libphonenumber.dart';

class Validations {
  static Future<bool> isValidPhone(
      String phone,
      String country,
      ) async {
    bool? isValid = await PhoneNumberUtil.isValidPhoneNumber(
      phoneNumber: phone,
      isoCode: country,
    );
    String? carrierName = await PhoneNumberUtil.getNameForNumber(
      phoneNumber: phone,
      isoCode: country,
    );
    PhoneNumberType type = await PhoneNumberUtil.getNumberType(
        phoneNumber: phone, isoCode: country);

    debugPrint(
        "Carrier is $carrierName' and isValid is ${isValid == null ? "null" : isValid.toString()}");

    return isValid != null && isValid && type == PhoneNumberType.mobile;
  }

  static Future<String> formatPhone(
      String phone,
      String country,
      ) async {
    var formatted = await PhoneNumberUtil.normalizePhoneNumber(
      phoneNumber: phone,
      isoCode: country,
    );

    if (formatted != null && formatted.startsWith("+")) {
      formatted = formatted.replaceAll("+", "");
    }

    debugPrint("Formatted number from $phone to $formatted");

    return formatted ?? phone;
  }
}
