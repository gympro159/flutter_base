import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_base/core/resources/resources.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

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
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: Colors.grey.shade700,
        onPrimary: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(36.0)),
        textStyle: GoogleFonts.inter(
          fontSize: fontMiddle,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.grey.shade300,
        primary: Colors.black, //Text Color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(36.0),
        ),
        side: BorderSide(color: Colors.black, width: 0.8),
        textStyle: GoogleFonts.inter(
          color: Colors.black,
          fontSize: fontMiddle,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),

    //! Define the default font family.
    fontFamily: 'Roboto',

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
      bodyColor: Colors.blue,
    ),
  );

  static final lightTheme = ThemeData(
    // canvasColor: Colors.transparent,
    //!Scaffold backgroundColor default
    scaffoldBackgroundColor: Colors.grey.shade100,

    //!Appbar default
    primaryColor: PRIMARY_COLOR,

    //!Text color default
    colorScheme: ColorScheme.light(),

    //!Icon system color default
    iconTheme: IconThemeData(color: Colors.white),
    primaryIconTheme: IconThemeData(color: Colors.white),
    accentIconTheme: IconThemeData(color: Colors.black),
    cardColor: Color(0xfff1f8ff),

    buttonColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: PRIMARY_COLOR,
        onPrimary: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(36.0)),
        textStyle: GoogleFonts.inter(
          fontSize: fontMiddle,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        primary: PRIMARY_COLOR, //Text Color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(36.0),
        ),
        side: BorderSide(color: PRIMARY_COLOR, width: 0.8),
        textStyle: GoogleFonts.inter(
          color: PRIMARY_COLOR,
          fontSize: fontMiddle,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),

    //! Define the default font family.
    fontFamily: 'Roboto',

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
