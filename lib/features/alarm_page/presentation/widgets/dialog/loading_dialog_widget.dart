import 'package:flutter/material.dart';
import 'package:flutter_base/core/resources/resources.dart';
import 'package:flutter_base/features/common/widgets/demo/demo_widget.dart';
import 'package:flutter_base/features/common/widgets/dialog/loading_dialog.dart';
import 'package:flutter_base/features/common/widgets/toast/toast.dart';

//!https://pub.dev/packages/flash

class LoadingDialogWidget extends StatelessWidget {
  const LoadingDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DemoWidget(
        title: 'Loading Dialog',
        content: Column(children: [
          //!Loading Dialog Basic
          ElevatedButton(
            onPressed: () => showLoadingDialog(
              context,
              icon: Icon(Icons.ac_unit, color: Colors.indigo),
              title: 'Loading',
              content: Column(
                children: [
                  SizedBox(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(PRIMARY_COLOR),
                      )),
                  SizedBox(height: 10),
                  Text('Loading...', style: TextStyle(color: PRIMARY_COLOR))
                ],
              ),
            ),
            child: Text('Show Loading Dialog'),
          ),
          SizedBox(height: 10),
          //!Loading Dialog transparent
          ElevatedButton(
            onPressed: () => showLoadingTransparentDialog(
              context,
              content: Column(
                children: [
                  SizedBox(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.cyan),
                      )),
                  SizedBox(height: 10),
                  Text('Loading...', style: TextStyle(color: Colors.cyan))
                ],
              ),
            ),
            child: Text('Show Loading Transparent Dialog'),
          ),
        ]),
        sourceCode: 'https://google.com');
  }
}
