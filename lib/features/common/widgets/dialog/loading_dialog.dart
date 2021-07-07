import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/core/resources/resources.dart';

showLoadingDialog(
  BuildContext context, {
  Color textColor = Colors.black,
  Color backgroundColor = Colors.white,
  Gradient? backgroundGradient,
  Widget? icon,
  String? title,
  String btnContent = 'Ok',
  required Widget content,
}) {
  FlashController<Object?>? flashController;
  showFlash(
    context: context,
    transitionDuration: const Duration(milliseconds: 200),
    onWillPop: () async {
      flashController!.dismiss();
      return false;
    },
    builder: (context, controller) {
      flashController = controller;
      return Flash.dialog(
        controller: controller,
        barrierDismissible: false,
        borderRadius: BorderRadius.circular(8),
        margin: EdgeInsets.all(16),
        backgroundColor: backgroundColor,
        backgroundGradient: backgroundGradient,
        child: FlashBar(
          title: title == null
              ? null
              : Container(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      icon == null ? SizedBox() : icon,
                      icon == null ? SizedBox() : SizedBox(width: 7),
                      Text(title,
                          style:
                              TextStyle(color: textColor, fontSize: fontHuge)),
                    ],
                  ),
                ),
          content: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              content,
            ],
          ),
        ),
      );
    },
  );
}

showLoadingTransparentDialog(
  BuildContext context, {
  Color textColor = Colors.black,
  String btnContent = 'Ok',
  required Widget content,
}) {
  FlashController<Object?>? flashController;
  showFlash(
    context: context,
    transitionDuration: const Duration(milliseconds: 200),
    onWillPop: () async {
      flashController!.dismiss();
      return false;
    },
    builder: (context, controller) {
      flashController = controller;
      return Flash.dialog(
        controller: controller,
        barrierDismissible: false,
        borderRadius: BorderRadius.circular(8),
        margin: EdgeInsets.all(16),
        backgroundColor: Colors.transparent,
        child: FlashBar(
          content: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              content,
            ],
          ),
        ),
      );
    },
  );
}
