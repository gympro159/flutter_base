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
            child: Text(title.toUpperCase(),
                style: Theme.of(context).textTheme.subtitle1)),
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Colors.grey.shade300, width: 0.3)),
        ),
      )
    ]..addAll(listCard);
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(0.5),
      child: Column(
        children: listcontent,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).buttonColor,
        border: Border.all(color: Colors.grey.shade900, width: 0.1),
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
