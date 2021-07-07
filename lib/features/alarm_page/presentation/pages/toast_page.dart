import 'package:flutter/material.dart';
import 'package:flutter_base/core/resources/resources.dart';
import 'package:flutter_base/features/common/widgets/demo/demo_widget.dart';
import 'package:flutter_base/features/common/widgets/toast/toast.dart';

//!https://pub.dev/packages/flash

class ToastPage extends StatelessWidget {
  const ToastPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Toast Base'),
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.only(left: 30, right: 30, top: 40, bottom: 40),
          children: [
            DemoWidget(
                title: 'Toast',
                content: Column(children: [
                  //!Toast Basic
                  ElevatedButton(
                    onPressed: () => showToast(
                      context,
                      backgroundGradient: LinearGradient(
                        colors: [Colors.indigo, Colors.deepPurple],
                      ),
                      content: 'This is a toast',
                    ),
                    child: Text('Show Toast'),
                  ),
                  SizedBox(height: 10),
                  //!Toast Custom
                  ElevatedButton(
                    onPressed: () => showToastCustom(
                      context,
                      backgroundGradient: LinearGradient(
                        colors: [Colors.indigo, Colors.deepPurple],
                      ),
                      content: Container(
                          child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.ac_unit, color: Colors.white),
                          SizedBox(width: 5),
                          Text('This is a toast custom',
                              style: TextStyle(color: Colors.white)),
                          SizedBox(width: 5),
                          Image.asset(
                            IMAGE_ASSETS_PATH + '4.jpg',
                            fit: BoxFit.fill,
                            height: 100,
                          )
                        ],
                      )),
                    ),
                    child: Text('Show Toast Custom'),
                  ),
                ]),
                sourceCode: 'https://google.com'),
          ],
        ));
  }
}
