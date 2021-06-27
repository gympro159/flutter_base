import 'package:flutter_base/core/functions/functions.dart';
import 'package:flutter_base/core/resources/resources.dart';
import 'package:flutter_base/core/utils/validate/validate.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkValidate implements Validate<String> {
  @override
  String validate(String url) {
    print(url);
    if (url.trim().isEmpty) return null;
    bool us = false;
    isLink(url).then((value) {
      us = value;
    });
    if (!us) {
      return trans(LINK_VALIDATE);
    }
    return null;
  }
}

Future<bool> isLink(String value) async {
  bool _isLink = true;
  _isLink = await canLaunch(value);
  return _isLink;
}
