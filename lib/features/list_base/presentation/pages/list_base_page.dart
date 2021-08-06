import 'package:flutter/material.dart';

class ListBasePage extends StatefulWidget {
  ListBasePage({Key? key}) : super(key: key);

  @override
  _ListBasePageState createState() => _ListBasePageState();
}

class _ListBasePageState extends State<ListBasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        title: Text('List Base'),
        centerTitle: true,
      ),
      body: SizedBox(),
    );
  }
}
