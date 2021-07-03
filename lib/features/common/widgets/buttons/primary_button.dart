import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

abstract class OnButtonClickListener {
  onClick(String id);
}

class PrimaryButton extends StatelessWidget {
  final String label;
  final String id;
  final State ctx;

  PrimaryButton({required this.label, required this.id, required this.ctx});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 6.0.h,
      child: ElevatedButton(
          style: Theme.of(context).elevatedButtonTheme.style,
          onPressed: () {
            try {
              (ctx as OnButtonClickListener).onClick(id);
            } catch (e) {
              throw e;
            }
          },
          child: Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )),
    );
  }
}

class PrimaryIconButton extends StatelessWidget {
  final String label;
  final String id;
  final State ctx;
  final IconData icon;

  PrimaryIconButton({
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
      child: ElevatedButton.icon(
          style: Theme.of(context).elevatedButtonTheme.style,
          onPressed: () {
            try {
              (ctx as OnButtonClickListener).onClick(id);
            } catch (e) {
              throw e;
            }
          },
          icon: Icon(icon),
          label: Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )),
    );
  }
}
