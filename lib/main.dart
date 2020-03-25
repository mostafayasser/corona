import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import './screens/main_screen.dart';
import './screens/HomePage.dart';
import './screens/forget_password.dart';
import 'models/app_localizations.dart';

void main() => runApp(EasyLocalization(
      child: MyApp(),
      supportedLocales: [
        Locale('en', 'US'),
        Locale('en', 'UK'),
        Locale('ar', 'EG')
      ],
      path: 'lang',
    ));

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool selected()
  {
    GestureDetector(
        onTap: () {
      setState(() {
        return true;
      });
    },
    );
    return false;
  }

  @override
  Widget build(BuildContext context) {

    void changeLocale(locale) {
      setState(() {
        print(locale);
        EasyLocalization.of(context).locale = locale;
      });
    }

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // List all of the app's supported locales here

      // These delegates make sure that the localization data for the proper language is loaded
      localizationsDelegates: [
        // THIS CLASS WILL BE ADDED LATER
        // A class which loads the translations from JSON files
        AppLocalizations.delegate,
        // Built-in localization of basic text for Material widgets
        GlobalMaterialLocalizations.delegate,
        // Built-in localization for text direction LTR/RTL
        GlobalWidgetsLocalizations.delegate,
        EasyLocalization.of(context).delegate,
      ],

      /// Returns a locale which will be used by the app
      localeResolutionCallback: (locale, supportedLocales) {
        if (locale == null) {
          return supportedLocales.first;
        }
        // Check if the current device locale is supported
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        // If the locale of the device is not supported, use the first one
        // from the list (English, in this case).
        return supportedLocales.first;
      },
      supportedLocales: EasyLocalization.of(context).supportedLocales,
      locale: EasyLocalization.of(context).locale,
      home: MainScreen(changeLocale: changeLocale),
      routes: {
        LoginScreen.route: (ctx) => LoginScreen(),
        SignupScreen.route: (ctx) => SignupScreen(),
        MainScreen.route: (ctx) => MainScreen(changeLocale: changeLocale,),
        HomePage.route: (ctx) => HomePage(changeLocale: changeLocale,),
        ForgetPasswordScreen.route : (ctx) => ForgetPasswordScreen(),
      },
    );
  }
}
