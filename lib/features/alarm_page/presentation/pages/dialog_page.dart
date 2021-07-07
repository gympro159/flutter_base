import 'package:flutter/material.dart';
import 'package:flutter_base/features/alarm_page/presentation/widgets/dialog/confirm_dialog_widget.dart';
import 'package:flutter_base/features/alarm_page/presentation/widgets/dialog/info_dialog_widget.dart';
import 'package:flutter_base/features/alarm_page/presentation/widgets/dialog/loading_dialog_widget.dart';

class DialogPage extends StatelessWidget {
  const DialogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dialog Base'),
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.only(left: 30, right: 30, top: 40, bottom: 40),
          children: [
            InfoDialogWidget(),
            ConfirmDialogWidget(),
            LoadingDialogWidget()
          ],
        ));
  }
}
