import 'package:flutter/material.dart';
import 'package:flutter_base/features/common/widgets/demo/demo_widget.dart';
import 'package:flutter_base/features/common/widgets/text/facebook_read_more.dart';
import 'package:sizer/sizer.dart';

class FBReadMoreWidget extends StatelessWidget {
  const FBReadMoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DemoWidget(
      title: 'Readmore (Facebook)',
      content: FbReadMore(
        title: 'Title: ',
        content:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        trimText: 'Show more',
        lineNum: 3,
        titleStyle: Theme.of(context).textTheme.bodyText1,
        contentStyle: Theme.of(context).textTheme.bodyText2,
        trimStyle: TextStyle(color: Colors.red, fontSize: 13.0.sp),
      ),
      sourceCode: 'https://gooogle.com',
    );
  }
}
