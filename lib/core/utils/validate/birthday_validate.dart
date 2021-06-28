import 'package:flutter_base/core/functions/handle_language.dart';
import 'package:flutter_base/core/resources/string_lang.dart';
import 'package:flutter_base/core/utils/validate/validate.dart';
import 'package:intl/intl.dart';

class DOBValidate extends Validate<String> {
  @override
  String validate(String value) {
    var inputFormat = DateFormat('dd/MM/yyyy');
    var outputFormat = DateFormat('yyyy-MM-dd');
    var valueFormat = outputFormat.format(inputFormat.parse(value));
    if (value.trim().isEmpty) return '';

    if (DateTime.now().difference(DateTime.parse(valueFormat)).inMicroseconds <
        0) {
      return trans(BIRTHDAY_VALIDATE)!;
    }
    return '';
  }
}
