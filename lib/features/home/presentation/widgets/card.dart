import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final String router;
  const CardWidget({Key? key, required this.title, required this.router})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).buttonColor,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => Navigator.pushNamed(context, router),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(title, style: Theme.of(context).textTheme.headline5),
            ),
          ),
        ),
      ),
    );
  }
}
