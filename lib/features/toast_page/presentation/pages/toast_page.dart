import 'package:flutter/material.dart';
import 'package:flutter_base/features/common/widgets/demo/demo_widget.dart';
import 'package:flutter_base/features/text_page/presentation/widgets/basic_text.dart';
import 'package:flutter_base/features/text_page/presentation/widgets/between_overflow_text_widget.dart';
import 'package:flutter_base/features/text_page/presentation/widgets/fb_readmore_widget.dart';
import 'package:flutter_base/features/text_page/presentation/widgets/marquee_widget.dart';

class ToastPage extends StatelessWidget {
  const ToastPage({Key? key}) : super(key: key);

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
            DemoWidget(
                title: 'Toast',
                content: Column(children: []),
                sourceCode: 'https://google.com')
          ],
        ));
  }
}
