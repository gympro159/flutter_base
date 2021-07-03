import 'package:flutter/material.dart';
import 'package:flutter_base/features/common/widgets/buttons/primary_button.dart';
import 'package:sizer/sizer.dart';

class OutlinedCustomButton extends StatelessWidget {
  final String id;
  final State ctx;
  final String label;
  OutlinedCustomButton({
    required this.label,
    required this.id,
    required this.ctx,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 6.0.h,
      child: OutlinedButton(
        onPressed: () {
          try {
            (ctx as OnButtonClickListener).onClick(id);
          } catch (e) {
            throw e;
          }
        },
        style: Theme.of(context).outlinedButtonTheme.style,
        child: Text(label),
      ),
    );
  }
}

class OutlinedIconCustomButton extends StatelessWidget {
  final String id;
  final State ctx;
  final String label;
  final IconData icon;
  OutlinedIconCustomButton({
    required this.label,
    required this.id,
    required this.ctx,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 6.0.h,
      child: OutlinedButton.icon(
        onPressed: () {
          try {
            (ctx as OnButtonClickListener).onClick(id);
          } catch (e) {
            throw e;
          }
        },
        icon: Icon(icon),
        style: Theme.of(context).outlinedButtonTheme.style,
        label: Text(label),
      ),
    );
  }
}
