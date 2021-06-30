import 'package:flutter/material.dart';

class TextPage extends StatelessWidget {
  const TextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Base'),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
