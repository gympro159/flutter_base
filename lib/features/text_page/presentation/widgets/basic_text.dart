import 'package:flutter/material.dart';
import 'package:flutter_base/features/common/widgets/demo/demo_widget.dart';

class BasicText extends StatelessWidget {
  const BasicText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DemoWidget(
      title: 'Basic Text',
      content: Container(
        child: Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit',
          style: Theme.of(context).textTheme.bodyText2,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      sourceCode: 'https://gooogle.com',
    );
  }
}
