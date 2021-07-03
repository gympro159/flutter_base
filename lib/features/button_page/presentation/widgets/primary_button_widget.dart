import 'package:flutter/material.dart';
import 'package:flutter_base/features/common/widgets/buttons/primary_button.dart';
import 'package:flutter_base/features/common/widgets/demo/demo_widget.dart';

class PrimaryButtonWidget extends StatefulWidget {
  const PrimaryButtonWidget({Key? key}) : super(key: key);

  @override
  _PrimaryButtonWidgetState createState() => _PrimaryButtonWidgetState();
}

class _PrimaryButtonWidgetState extends State<PrimaryButtonWidget>
    implements OnButtonClickListener {
  @override
  Widget build(BuildContext context) {
    return DemoWidget(
      title: 'Primary Button',
      content: Container(
          width: 200,
          child: PrimaryButton(label: 'Primary Button', id: 'id', ctx: this)),
      sourceCode: 'https://google.com',
    );
  }

  @override
  onClick(String id) {
    if (id == 'id') {
      print('Primary Button');
    }
  }
}

class PrimaryIconButtonWidget extends StatefulWidget {
  const PrimaryIconButtonWidget({Key? key}) : super(key: key);

  @override
  _PrimaryIconButtonWidgetState createState() =>
      _PrimaryIconButtonWidgetState();
}

class _PrimaryIconButtonWidgetState extends State<PrimaryIconButtonWidget>
    implements OnButtonClickListener {
  @override
  Widget build(BuildContext context) {
    return DemoWidget(
      title: 'Primary Icon Button',
      content: Container(
          child: PrimaryIconButton(
        label: 'Primary Icon Button',
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
      print('Primary Icon Button');
    }
  }
}
