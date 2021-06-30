import 'package:flutter/material.dart';
import 'package:flutter_base/features/home/presentation/widgets/card.dart';

class FormCards extends StatelessWidget {
  final String title;
  final List<CardWidget> listCard;
  const FormCards({Key? key, required this.title, required this.listCard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> listcontent = [
      Container(
        padding: EdgeInsets.all(10),
        child: Center(
            child: Text(title, style: Theme.of(context).textTheme.subtitle1)),
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Colors.grey.shade300, width: 0.5)),
        ),
      )
    ]..addAll(listCard);
    return Container(
      child: Column(
        children: listcontent,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).buttonColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
    );
  }
}
