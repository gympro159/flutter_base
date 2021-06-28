import 'package:flutter_base/core/functions/handle_language.dart';
import 'package:flutter_base/core/resources/string_lang.dart';
import 'package:flutter_base/core/utils/validate/validate.dart';

class EmptyValidate extends Validate<String> {
  String? errorText;
  EmptyValidate({this.errorText});
  @override
  String validate(String value) {
    if (value.trim().isEmpty ||
        (errorText == trans(PERMANENT_WARDS_VALIDATE_EMPTY) &&
            value == trans(SELECT_))) {
      // if (errorText != null) return errorText;
      return trans(REQUIRE_FIELD_INFO)!;
    }

    return '';
  }
}
