import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/core/resources/font_sizes.dart';

showSnackbar(
  BuildContext context, {
  FlashPosition position = FlashPosition.top,
  Color textColor = Colors.white,
  Color backgroundColor = Colors.grey,
  Gradient? backgroundGradient,
  Widget? icon,
  IconButton? primaryAction,
  String? title,
  required String content,
}) {
  FlashController<Object?>? flashController;
  showFlash(
    context: context,
    duration: const Duration(seconds: 2),
    transitionDuration: const Duration(milliseconds: 200),
    onWillPop: () async {
      flashController!.dismiss();
      return false;
    },
    builder: (context, controller) {
      flashController = controller;
      return Flash.bar(
        controller: controller,
        barrierColor: Colors.transparent,
        backgroundColor: backgroundColor,
        backgroundGradient: backgroundGradient,
        position: position,
        enableVerticalDrag: true,
        horizontalDismissDirection: HorizontalDismissDirection.horizontal,
        child: FlashBar(
          title: title == null
              ? null
              : Text(title,
                  style: TextStyle(color: textColor, fontSize: fontHuge)),
          icon: icon,
          primaryAction: primaryAction,
          content: Text(
            content,
            style: TextStyle(color: textColor),
          ),
        ),
      );
    },
  );
}

showSnackbarCustom(
  BuildContext context, {
  FlashPosition position = FlashPosition.top,
  Color textColor = Colors.white,
  Color backgroundColor = Colors.grey,
  Gradient? backgroundGradient,
  Widget? icon,
  IconButton? primaryAction,
  String? title,
  required Widget content,
}) {
  FlashController<Object?>? flashController;
  showFlash(
    context: context,
    duration: const Duration(seconds: 2),
    transitionDuration: const Duration(milliseconds: 200),
    onWillPop: () async {
      flashController!.dismiss();
      return false;
    },
    builder: (context, controller) {
      flashController = controller;
      return Flash.bar(
        controller: controller,
        barrierColor: Colors.transparent,
        backgroundColor: backgroundColor,
        backgroundGradient: backgroundGradient,
        position: position,
        enableVerticalDrag: true,
        horizontalDismissDirection: HorizontalDismissDirection.horizontal,
        child: FlashBar(
          title: title == null
              ? null
              : Text(title,
                  style: TextStyle(color: textColor, fontSize: fontHuge)),
          icon: icon,
          primaryAction: primaryAction,
          content: content,
        ),
      );
    },
  );
}
