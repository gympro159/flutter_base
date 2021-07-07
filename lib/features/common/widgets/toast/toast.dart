import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

showToast(
  BuildContext context, {
  Color textColor = Colors.white,
  Color backgroudColor = Colors.black,
  Gradient? backgroundGradient,
  Alignment alignment = Alignment.bottomCenter,
  required String content,
}) {
  FlashController<Object?>? flashController;
  showFlash(
    context: context,
    duration: const Duration(seconds: 2),
    transitionDuration: const Duration(milliseconds: 200),
    onWillPop: () async {
      flashController!.dismiss();
      return true;
    },
    builder: (context, controller) {
      flashController = controller;
      return Flash.dialog(
        controller: controller,
        borderRadius: BorderRadius.circular(26),
        barrierColor: Colors.transparent,
        backgroundColor: backgroudColor,
        backgroundGradient: backgroundGradient,
        alignment: alignment,
        margin: const EdgeInsets.only(bottom: 40),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
          child: Text(
            content,
            style: TextStyle(color: textColor),
          ),
        ),
      );
    },
  );
}

showToastCustom(
  BuildContext context, {
  Color textColor = Colors.white,
  Color backgroudColor = Colors.black,
  Gradient? backgroundGradient,
  Alignment alignment = Alignment.bottomCenter,
  required Widget content,
}) {
  FlashController<Object?>? flashController;
  showFlash(
    context: context,
    duration: const Duration(seconds: 2),
    transitionDuration: const Duration(milliseconds: 200),
    onWillPop: () async {
      flashController!.dismiss();
      return true;
    },
    builder: (context, controller) {
      flashController = controller;
      return Flash.dialog(
        controller: controller,
        borderRadius: BorderRadius.circular(26),
        barrierColor: Colors.transparent,
        backgroundColor: backgroudColor,
        backgroundGradient: backgroundGradient,
        alignment: alignment,
        margin: const EdgeInsets.only(bottom: 40),
        child: Padding(
            padding:
                const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
            child: content),
      );
    },
  );
}
