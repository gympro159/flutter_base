import 'package:flutter/material.dart';
import 'package:flutter_base/core/resources/resources.dart';
import 'package:flutter_base/features/common/widgets/demo/demo_widget.dart';
import 'package:flutter_base/features/common/widgets/dialog/loading_dialog.dart';
import 'package:flutter_base/features/common/widgets/dialog/modal_bottom_sheet.dart';
import 'package:flutter_base/features/common/widgets/toast/toast.dart';

//!https://pub.dev/packages/flash

class ModalBottomSheetWidget extends StatelessWidget {
  const ModalBottomSheetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DemoWidget(
        title: 'Modal Bottom Sheet',
        content: Column(children: [
          ElevatedButton(
            onPressed: () => showModalBottomSheetCustom(
              context,
              content: Container(
                height: 250,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.ac_unit, color: Colors.black),
                          SizedBox(width: 5),
                          Text('This is a Info Dialog',
                              style: TextStyle(color: Colors.black)),
                          SizedBox(width: 5),
                          Image.asset(
                            IMAGE_ASSETS_PATH + '3.jpg',
                            fit: BoxFit.fill,
                            height: 100,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.ac_unit, color: Colors.black),
                          SizedBox(width: 5),
                          Text('This is a Info Dialog',
                              style: TextStyle(color: Colors.black)),
                          SizedBox(width: 5),
                          Image.asset(
                            IMAGE_ASSETS_PATH + '1.jpg',
                            fit: BoxFit.fill,
                            height: 100,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            child: Text('Show Modal Bottom Sheet'),
          ),
        ]),
        sourceCode: 'https://google.com');
  }
}
