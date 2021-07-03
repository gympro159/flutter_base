import 'package:flutter/material.dart';
import 'package:flutter_base/app_localizations.dart';
import 'package:flutter_base/core/providers/theme.dart';
import 'package:flutter_base/core/resources/routers.dart';
import 'package:flutter_base/features/button_page/presentation/pages/button_page.dart';
import 'package:flutter_base/features/home/presentation/pages/home.dart';
import 'package:flutter_base/features/text_page/presentation/pages/text_page.dart';
import 'package:flutter_base/injection_container.dart';
import 'package:provider/provider.dart';
import 'injection_container.dart' as di;
import 'package:bloc/bloc.dart';
import 'package:flutter_base/simple_bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  static void setLocale(BuildContext context, Locale newLocale) async {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.changeLanguage(newLocale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  final prefs = singleton<SharedPreferences>();

  changeLanguage(Locale locale) {
    //print('locale: ${locale}');
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return ChangeNotifierProvider(
            create: (context) => ThemeProvider(),
            builder: (context, snapshot) {
              final themeProvider = Provider.of<ThemeProvider>(context);
              return MaterialApp(
                title: 'Flutter Base',
                theme: MyThemes.lightTheme,
                darkTheme: MyThemes.darkTheme,
                themeMode: themeProvider.themeMode,
                locale: _locale,
                supportedLocales: [
                  const Locale('vi', ''), // Vietnam, no country code
                  const Locale('en', ''), // English, no country code
                ],
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                localeResolutionCallback: (locale, supportedLocales) {
                  for (var supportedLocale in supportedLocales) {
                    if (supportedLocale.languageCode ==
                        prefs.getString('languageDevice')) {
                      return supportedLocale;
                    }
                  }
                  // Check if the current device locale is supported
                  for (var supportedLocale in supportedLocales) {
                    if (supportedLocale.languageCode == locale!.languageCode) {
                      return supportedLocale;
                    }
                  }
                  // If the locale of the device is not supported, use the first one
                  // from the list (Vietnamese, in this case).
                  return supportedLocales.first;
                },
                initialRoute: ROUTER_HOME,
                routes: {
                  ROUTER_HOME: (context) => MyHomePage(title: 'Flutter Book'),
                  ROUTER_TEXT_PAGE: (context) => TextPage(),
                  ROUTER_BUTTON_PAGE: (context) => ButtonPage(),
                },
              );
            });
      },
    );
  }
}
