import 'package:flutter/material.dart';
import 'package:flutter_base/core/resources/resources.dart';
import 'package:flutter_base/features/common/widgets/demo/demo_widget.dart';
import 'package:flutter_base/features/common/widgets/dialog/info_dialog.dart';
import 'package:flutter_base/features/common/widgets/toast/toast.dart';

//!https://pub.dev/packages/flash

class InfoDialogWidget extends StatelessWidget {
  const InfoDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DemoWidget(
        title: 'Info Dialog',
        content: Column(children: [
          //!Info Dialog Basic
          ElevatedButton(
            onPressed: () => showInfoDialog(
              context,
              icon: Icon(Icons.info, color: Colors.indigo),
              title: 'Title here',
              content: 'This is a Info Dialog',
            ),
            child: Text('Show Info Dialog'),
          ),
          SizedBox(height: 10),
          //!Info Dialog custom
          ElevatedButton(
            onPressed: () => showInfoDialogCustom(
              context,
              icon: Icon(Icons.info, color: Colors.indigo),
              title: 'Title here',
              content: Container(
                  child: Center(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Icon(Icons.ac_unit, color: Colors.black),
                    SizedBox(width: 5),
                    Text('This is a Info Dialog',
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
            ),
            child: Text('Show Info Dialog Custom'),
          ),
        ]),
        sourceCode: 'https://google.com');
  }
}
