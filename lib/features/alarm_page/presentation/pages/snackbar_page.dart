import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/core/resources/resources.dart';
import 'package:flutter_base/features/common/widgets/demo/demo_widget.dart';
import 'package:flutter_base/features/common/widgets/snackbar/snackbar.dart';

//!https://pub.dev/packages/flash

class SnackbarPage extends StatelessWidget {
  const SnackbarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Snackbar Base'),
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.only(left: 30, right: 30, top: 40, bottom: 40),
          children: [
            DemoWidget(
                title: 'Snackbar',
                content: Column(children: [
                  //!Snackbar Basic
                  ElevatedButton(
                    onPressed: () => showSnackbar(
                      context,
                      backgroundGradient: LinearGradient(
                        colors: [Colors.indigo, Colors.deepPurple],
                      ),
                      icon: Icon(Icons.info, color: Colors.white),
                      primaryAction: IconButton(
                          onPressed: () => print('Icon Action'),
                          icon: Icon(Icons.navigate_next,
                              color: Colors.white, size: 30)),
                      title: 'Title here',
                      content: 'This is a snackbar',
                    ),
                    child: Text('Show Snackbar'),
                  ),
                  SizedBox(height: 10),
                  //!Snackbar custom
                  ElevatedButton(
                    onPressed: () => showSnackbarCustom(
                      context,
                      backgroundGradient: LinearGradient(
                        colors: [Colors.indigo, Colors.deepPurple],
                      ),
                      position: FlashPosition.bottom,
                      icon: Icon(Icons.accessibility, color: Colors.white),
                      primaryAction: IconButton(
                          onPressed: () => print('Icon Action'),
                          icon: Icon(Icons.assistant_direction_sharp,
                              color: Colors.white, size: 30)),
                      title: 'Title here',
                      content: Container(
                          child: Center(
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Icon(Icons.ac_unit, color: Colors.white),
                            SizedBox(width: 5),
                            Text('This is a snackbar',
                                style: TextStyle(color: Colors.white)),
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
                    child: Text('Show Snackbar Custom'),
                  ),
                ]),
                sourceCode: 'https://google.com'),
          ],
        ));
  }
}
