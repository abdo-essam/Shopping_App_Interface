
  import 'package:flutter/material.dart';
  import 'package:flutter_localizations/flutter_localizations.dart';
  import 'lang/app_localizations.dart';
  import 'lang/app_localizations_delegate.dart';
  import 'screens/signup_screen.dart';

  void main() {
    runApp(const ShoppingApp());
  }

  class ShoppingApp extends StatelessWidget {
    const ShoppingApp({super.key});

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('ar'),
        ],
        locale: const Locale('ar'), // Set initial locale to Arabic
        title: "Shopping App",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SignUpScreen(),
      );
    }
  }