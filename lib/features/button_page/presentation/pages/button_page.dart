import 'package:flutter/material.dart';
import 'package:flutter_base/features/button_page/presentation/widgets/outlined_button_widget.dart';
import 'package:flutter_base/features/button_page/presentation/widgets/primary_button_widget.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Text Base'),
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.only(left: 30, right: 30, top: 40, bottom: 40),
          children: [
            PrimaryButtonWidget(),
            PrimaryIconButtonWidget(),
            OutlinedButtonWidget(),
            OutlinedIconButtonWidget(),
          ],
        ));
  }
}
