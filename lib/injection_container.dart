import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

final singleton = GetIt.instance;

Future<void> init() async {
  //! Core

  //! External
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();
  final sharedPreferences = await SharedPreferences.getInstance();
  singleton.registerLazySingleton(() => sharedPreferences);
  // singleton.registerLazySingleton(() => packageInfo);
  singleton.registerLazySingleton(() => http.Client());
  final downloadLocalNotification = FlutterLocalNotificationsPlugin();
  singleton.registerLazySingleton(() => downloadLocalNotification);
}
