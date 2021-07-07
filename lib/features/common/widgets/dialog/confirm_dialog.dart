import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_base/core/resources/resources.dart';

showConfirmDialog(
  BuildContext context, {
  Color textColor = Colors.black,
  Color backgroundColor = Colors.white,
  Gradient? backgroundGradient,
  Widget? icon,
  String? title,
  String btnAcceptContent = 'Ok',
  String btnCancelContent = 'Cancel',
  required String content,
  required void Function() confirmAction,
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
          content: Text(
            content,
            style: TextStyle(color: textColor),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => controller.dismiss(),
              style: Theme.of(context).textButtonTheme.style,
              child: Text(btnCancelContent,
                  style: TextStyle(color: Colors.grey[400])),
            ),
            TextButton(
              onPressed: confirmAction,
              style: Theme.of(context).textButtonTheme.style,
              child: Text(btnAcceptContent,
                  style: TextStyle(color: PRIMARY_COLOR)),
            ),
          ],
        ),
      );
    },
  );
}

showConfirmDialogCustom(
  BuildContext context, {
  Color textColor = Colors.black,
  Color backgroundColor = Colors.white,
  Gradient? backgroundGradient,
  Widget? icon,
  String? title,
  String btnAcceptContent = 'Ok',
  String btnCancelContent = 'Cancel',
  required Widget content,
  required void Function() confirmAction,
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
          content: content,
          actions: <Widget>[
            TextButton(
              onPressed: () => controller.dismiss(),
              style: Theme.of(context).textButtonTheme.style,
              child: Text(btnCancelContent,
                  style: TextStyle(color: Colors.grey[400])),
            ),
            TextButton(
              onPressed: confirmAction,
              style: Theme.of(context).textButtonTheme.style,
              child: Text(btnAcceptContent,
                  style: TextStyle(color: PRIMARY_COLOR)),
            ),
          ],
        ),
      );
    },
  );
}
