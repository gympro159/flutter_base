import 'package:flutter_base/core/functions/handle_language.dart';
import 'package:flutter_base/core/resources/resources.dart';
import 'package:intl/intl.dart';

String handleTime(String time) {
  String result = '';
  if (time == null || time == '') return '9999-99-99 99:99:99';
  if (DateTime.now().difference(DateTime.parse(time)).inSeconds < 0) {
    result = '0 ' + trans(LABEL_SECONDS_AGO);
  } else if (DateTime.now().difference(DateTime.parse(time)).inSeconds < 60) {
    result =
        DateTime.now().difference(DateTime.parse(time)).inSeconds.toString() +
            ' ' +
            trans(LABEL_SECONDS_AGO);
  } else if (DateTime.now().difference(DateTime.parse(time)).inMinutes < 60) {
    result =
        DateTime.now().difference(DateTime.parse(time)).inMinutes.toString() +
            ' ' +
            trans(LABEL_MINUTES_AGO);
  } else if (DateTime.now().difference(DateTime.parse(time)).inHours < 24) {
    result =
        DateTime.now().difference(DateTime.parse(time)).inHours.toString() +
            ' ' +
            trans(LABEL_HOURS_AGO);
  } else {
    result = DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.parse(time));
  }

  return result;
}
