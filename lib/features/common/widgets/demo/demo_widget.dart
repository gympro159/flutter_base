import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DemoWidget extends StatelessWidget {
  final String title;
  final Widget content;
  final String sourceCode;
  const DemoWidget(
      {Key? key,
      required this.title,
      required this.content,
      required this.sourceCode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(0.5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: Theme.of(context).textTheme.subtitle2),
                InkWell(
                    onTap: () async {
                      if (await canLaunch(sourceCode)) launch(sourceCode);
                    },
                    child: Icon(
                      Icons.code,
                      color: Theme.of(context).accentIconTheme.color,
                    ))
              ],
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              // border: Border(
              //     bottom: BorderSide(color: Colors.grey.shade300, width: 0.3)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: content,
          )
        ],
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).buttonColor,
        border: Border.all(color: Colors.grey.shade900, width: 0.1),
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
