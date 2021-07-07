import 'package:flutter/material.dart';
import 'package:flutter_base/core/resources/resources.dart';
import 'package:flutter_base/features/common/widgets/demo/demo_widget.dart';
import 'package:flutter_base/features/common/widgets/dialog/confirm_dialog.dart';
import 'package:flutter_base/features/common/widgets/toast/toast.dart';

//!https://pub.dev/packages/flash

class ConfirmDialogWidget extends StatelessWidget {
  const ConfirmDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DemoWidget(
        title: 'Confirm Dialog',
        content: Column(children: [
          //!Confirm Dialog Basic
          ElevatedButton(
            onPressed: () => showConfirmDialog(
              context,
              icon: Icon(Icons.accessibility_new_sharp, color: Colors.indigo),
              title: 'Title here',
              content: 'This is a Confirm Dialog',
              confirmAction: () {
                print('Confirm action');
                //!TODO
              },
            ),
            child: Text('Show Confirm Dialog'),
          ),
          SizedBox(height: 10),
          //!Confirm Dialog custom
          ElevatedButton(
            onPressed: () => showConfirmDialogCustom(
              context,
              icon: Icon(Icons.accessibility_new_sharp, color: Colors.indigo),
              title: 'Title here',
              content: Container(
                  child: Center(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Icon(Icons.ac_unit, color: Colors.black),
                    SizedBox(width: 5),
                    Text('This is a Confirm Dialog',
                        style: TextStyle(color: Colors.black)),
                    SizedBox(width: 5),
                    Image.asset(
                      IMAGE_ASSETS_PATH + '4.jpg',
                      fit: BoxFit.fill,
                      height: 100,
                    )
                  ],
                ),
              )),
              confirmAction: () {
                print('Confirm action');
                //!TODO
              },
            ),
            child: Text('Show Confirm Dialog Custom'),
          ),
        ]),
        sourceCode: 'https://google.com');
  }
}
