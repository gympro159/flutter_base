import 'package:flutter_base/core/functions/functions.dart';
import 'package:flutter_base/core/resources/resources.dart';
import 'package:flutter_base/core/utils/validate/validate.dart';

class PasswordValidate implements Validate<String> {
  @override
  String validate(String value) {
    if (value.isEmpty) return trans(REQUIRE_FIELD_INFO);
    if (!RegExp(
            r'^(?=.*?[A-Z])(?=(.*[a-z]){1,})(?=(.*[\d]){1,})(?=(.*[\W]){1,})(?!.*\s).{8,}$',
            caseSensitive: false)
        .hasMatch(value)) {
      return trans(PASSWORD_VALIDATE)!;
    }
    return '';
  }
}
