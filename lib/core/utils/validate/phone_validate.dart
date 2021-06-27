import 'package:flutter_base/core/functions/functions.dart';
import 'package:flutter_base/core/resources/resources.dart';
import 'package:flutter_base/core/utils/validate/validate.dart';

class PhoneValidate extends Validate<String> {
  @override
  String validate(String value) {
    Pattern pattern = r'^0[1-9][0-9]+[0-9]{7,8}$';
    RegExp regex = new RegExp(pattern);
    if (value.trim().isEmpty) {
      return trans(REQUIRE_FIELD_INFO);
    } else if (!regex.hasMatch(value.trim())) {
      return trans(PHONE_VALIDATE_WRONG_FORMAT);
    } else
      return null;
  }
}
