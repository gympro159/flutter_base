import 'package:flutter/material.dart';
import 'package:flutter_base/features/common/widgets/demo/demo_widget.dart';
import 'package:flutter_base/features/common/widgets/text/between_overflow_richtext.dart';

class BetweenOverflowTextWidget extends StatelessWidget {
  const BetweenOverflowTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DemoWidget(
      title: 'Between Overflow Text',
      content: BetweenOverflowRichtext(
        title: 'Title: ',
        content:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit',
        trimText: ' anim id est laborum.',
        lineNum: 3,
        titleStyle: Theme.of(context).textTheme.bodyText1,
        contentStyle: Theme.of(context).textTheme.bodyText2,
        trimStyle: Theme.of(context).textTheme.bodyText2,
      ),
      sourceCode: 'https://gooogle.com',
    );
  }
}
