import 'package:flutter/material.dart';

class FormCards extends StatelessWidget {
  final String title;
  final List<Widget> listCard;
  const FormCards({Key? key, required this.title, required this.listCard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> listcontent = [
      Container(
        child: Text(title, style: Theme.of(context).textTheme.subtitle1),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300, width: 0.5),
        ),
      )
    ]..addAll(listCard);
    return Container(
      child: Column(
        children: listcontent,
      ),
    );
  }
}
