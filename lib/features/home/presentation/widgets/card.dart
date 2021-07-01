import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final String router;
  final bool? cardLast;
  const CardWidget(
      {Key? key, required this.title, required this.router, this.cardLast})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).buttonColor,
          borderRadius: BorderRadius.circular(cardLast == true ? 16 : 0)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => Navigator.pushNamed(context, router),
          borderRadius: cardLast == true
              ? BorderRadius.vertical(bottom: Radius.circular(16))
              : BorderRadius.zero,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(title, style: Theme.of(context).textTheme.bodyText2),
            ),
          ),
        ),
      ),
    );
  }
}
