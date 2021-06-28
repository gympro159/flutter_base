import 'package:flutter_base/core/functions/functions.dart';
import 'package:flutter_base/core/resources/resources.dart';
import 'package:flutter_base/core/utils/validate/validate.dart';

class EmailValidate extends Validate<String> {
  @override
  String validate(String value) {
    if (value.trim().isEmpty) return '';

    if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value.trim()) ==
        false) {
      return trans(EMAIL_VALIDATE_WRONG_FORMAT)!;
    }
    return '';
  }
}
