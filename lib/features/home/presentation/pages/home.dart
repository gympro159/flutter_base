import 'package:flutter/material.dart';
import 'package:flutter_base/core/resources/resources.dart';
import 'package:flutter_base/features/home/presentation/widgets/card.dart';
import 'package:flutter_base/features/home/presentation/widgets/drawer.dart';
import 'package:flutter_base/features/home/presentation/widgets/form_cards.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: Theme.of(context).iconTheme,
          title: Text(widget.title),
        ),
        drawer: HomeDrawer(),
        body: Padding(
          padding:
              const EdgeInsets.only(top: 40, bottom: 40, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FormCards(
                title: 'Text',
                listCard: [CardWidget(title: 'Text', router: ROUTER_TEXT_PAGE)],
              )
            ],
          ),
        ));
  }
}
