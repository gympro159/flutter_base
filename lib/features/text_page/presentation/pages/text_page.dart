import 'package:flutter/material.dart';
import 'package:flutter_base/features/text_page/presentation/widgets/basic_text.dart';
import 'package:flutter_base/features/text_page/presentation/widgets/between_overflow_text_widget.dart';
import 'package:flutter_base/features/text_page/presentation/widgets/fb_readmore_widget.dart';
import 'package:flutter_base/features/text_page/presentation/widgets/marquee_widget.dart';

class TextPage extends StatelessWidget {
  const TextPage({Key? key}) : super(key: key);

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
            BasicText(),
            FBReadMoreWidget(),
            BetweenOverflowTextWidget(),
            MarqueeWidget(),
          ],
        ));
  }
}
