import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_base/core/functions/functions.dart';
import 'package:flutter_base/core/resources/resources.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:connectivity/connectivity.dart';

Future<bool> checkNetwork(BuildContext context) async {
  FocusScope.of(context).unfocus();
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Fluttertoast.showToast(
        msg: trans(ERROR_CONNECTION_FAILED)!,
      );
    });
    return false;
  }
  return false;
  // var connectivityResult = await (Connectivity().checkConnectivity());
  // if (connectivityResult == ConnectivityResult.mobile) {
  //   return true;
  // } else if (connectivityResult == ConnectivityResult.wifi) {
  //   return true;
  // }
  // WidgetsBinding.instance.addPostFrameCallback((_) {
  //   showToast(
  //     msg: trans(ERROR_CONNECTION_FAILED),
  //     context: context,
  //   );
  // });
  // return false;
}

Future<bool> checkNetworkNoToast(BuildContext context) async {
  FocusScope.of(context).unfocus();
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }
  return false;
  // var connectivityResult = await (Connectivity().checkConnectivity());
  // if (connectivityResult == ConnectivityResult.mobile) {
  //   return true;
  // } else if (connectivityResult == ConnectivityResult.wifi) {
  //   return true;
  // }
  // return false;
}
