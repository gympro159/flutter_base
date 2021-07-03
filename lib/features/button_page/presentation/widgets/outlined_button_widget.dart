import 'package:flutter/material.dart';
import 'package:flutter_base/features/common/widgets/buttons/outline_custom_button.dart';
import 'package:flutter_base/features/common/widgets/buttons/primary_button.dart';
import 'package:flutter_base/features/common/widgets/demo/demo_widget.dart';

class OutlinedButtonWidget extends StatefulWidget {
  const OutlinedButtonWidget({Key? key}) : super(key: key);

  @override
  _OutlinedButtonWidgetState createState() => _OutlinedButtonWidgetState();
}

class _OutlinedButtonWidgetState extends State<OutlinedButtonWidget>
    implements OnButtonClickListener {
  @override
  Widget build(BuildContext context) {
    return DemoWidget(
      title: 'Outlined Button',
      content: Container(
          width: 200,
          child: OutlinedCustomButton(
              label: 'Outlined Button', id: 'id', ctx: this)),
      sourceCode: 'https://google.com',
    );
  }

  @override
  onClick(String id) {
    if (id == 'id') {
      print('Outlined Button');
    }
  }
}

class OutlinedIconButtonWidget extends StatefulWidget {
  const OutlinedIconButtonWidget({Key? key}) : super(key: key);

  @override
  _OutlinedIconButtonWidgetState createState() =>
      _OutlinedIconButtonWidgetState();
}

class _OutlinedIconButtonWidgetState extends State<OutlinedIconButtonWidget>
    implements OnButtonClickListener {
  @override
  Widget build(BuildContext context) {
    return DemoWidget(
      title: 'Outlined Icon Button',
      content: Container(
          child: OutlinedIconCustomButton(
        label: 'Outlined Icon Button',
        id: 'id',
        ctx: this,
        icon: Icons.ac_unit,
      )),
      sourceCode: 'https://google.com',
    );
  }

  @override
  onClick(String id) {
    if (id == 'id') {
      print('Outlined Icon Button');
    }
  }
}
