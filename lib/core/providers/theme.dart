import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:sizer/sizer.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance!.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    // canvasColor: Colors.transparent,
    //!Scaffold backgroundColor default
    scaffoldBackgroundColor: Colors.black,

    //!Appbar color default
    primaryColor: Colors.grey.shade900,

    //!Text color system default
    colorScheme: ColorScheme.dark(),

    //!Icon system color default
    iconTheme: IconThemeData(color: Colors.white),
    primaryIconTheme: IconThemeData(color: Colors.white),
    accentIconTheme: IconThemeData(color: Colors.white),
    cardColor: Colors.grey.shade900,

    buttonColor: Colors.grey.shade900,

    // Define the default font family.
    fontFamily: 'Georgia',

    // Define the default TextTheme. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: TextTheme(
      subtitle1: TextStyle(fontSize: 15.0.sp, fontWeight: FontWeight.bold),
      subtitle2: TextStyle(fontSize: 14.0.sp, fontWeight: FontWeight.bold),
      headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      headline5: TextStyle(fontSize: 30.0),
      headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      bodyText1: TextStyle(fontSize: 14.0.sp, fontWeight: FontWeight.bold),
      bodyText2: TextStyle(fontSize: 14.0.sp),
    ).apply(
      //!Text color custom default
      bodyColor: Colors.blue,
    ),
  );

  static final lightTheme = ThemeData(
    // canvasColor: Colors.transparent,
    //!Scaffold backgroundColor default
    scaffoldBackgroundColor: Colors.grey.shade100,

    //!Appbar default
    primaryColor: Colors.red,

    //!Text color default
    colorScheme: ColorScheme.light(),

    //!Icon system color default
    iconTheme: IconThemeData(color: Colors.white),
    primaryIconTheme: IconThemeData(color: Colors.white),
    accentIconTheme: IconThemeData(color: Colors.black),
    cardColor: Color(0xfff1f8ff),

    buttonColor: Colors.white,

    //! Define the default font family.
    fontFamily: 'Georgia',

    //! Define the default TextTheme. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: TextTheme(
      subtitle1: TextStyle(fontSize: 15.0.sp, fontWeight: FontWeight.bold),
      subtitle2: TextStyle(fontSize: 14.0.sp, fontWeight: FontWeight.bold),
      headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      headline5: TextStyle(fontSize: 30.0),
      headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      bodyText1: TextStyle(fontSize: 14.0.sp, fontWeight: FontWeight.bold),
      bodyText2: TextStyle(fontSize: 14.0.sp),
    ).apply(
      //!Text color custom default
      bodyColor: Colors.black,
    ),
  );
}
