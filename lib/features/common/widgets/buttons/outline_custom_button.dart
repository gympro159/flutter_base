import 'package:flutter/material.dart';
import 'package:flutter_base/core/resources/resources.dart';
import 'package:flutter_base/features/common/widgets/buttons/primary_button.dart';
import 'package:google_fonts/google_fonts.dart';

class OutlineCustomButton extends StatelessWidget {
  final String id;
  final State ctx;
  final String label;
  final bool disable;
  final bool isLableBold;
  OutlineCustomButton(
      {required this.label,
      required this.id,
      required this.ctx,
      this.disable = false,
      this.isLableBold = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 44,
      child: OutlineButton(
        disabledBorderColor: DISABLE_COLOR,
        disabledTextColor: DISABLE_TEXT_COLOR,
        onPressed: () {
          try {
            (ctx as OnButtonClickListener).onClick(id);
          } catch (e) {
            throw e;
          }
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(36),
        ),
        borderSide: BorderSide(color: PRIMARY_COLOR, width: 0.8),
        child: Text(
          label,
          style: GoogleFonts.inter(
              fontSize: fontMiddle,
              color: PRIMARY_COLOR,
              fontWeight: isLableBold ? FontWeight.bold : FontWeight.normal),
        ),
      ),
    );
  }
}
