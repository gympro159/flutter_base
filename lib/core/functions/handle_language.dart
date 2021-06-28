import 'package:flutter/material.dart';
import 'package:flutter_base/app_localizations.dart';
import 'package:flutter_base/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui' as ui;

String getLangCode() {
  final prefs = singleton<SharedPreferences>();
  String locale = ui.window.locale.languageCode;
  String result = "vi";

  result = prefs.getString('languageDevice') == "en"
      ? "en"
      : prefs.getString('languageDevice') == "vi"
          ? "vi"
          : locale == "en"
              ? "en"
              : "vi";
  return result;
}

String trans(String key) {
  return AppLocalizations.instance!.translate(key) ?? "";
}

//Dùng để reload lại trang khi chuyển ngôn ngữ
String transWithContext(String key, BuildContext context) {
  return AppLocalizations.of(context)!.translate(key) ?? "";
}
