import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

showModalBottomSheetCustom(
  BuildContext context, {
  Color backgroundColor = Colors.white,
  Gradient? backgroundGradient,
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
      return Flash.bar(
        controller: controller,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        barrierColor: Colors.black54,
        backgroundColor: backgroundColor,
        backgroundGradient: backgroundGradient,
        position: FlashPosition.bottom,
        enableVerticalDrag: true,
        child: FlashBar(
          content: content,
        ),
      );
    },
  );
}
