import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:ui' as ui;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localeResolutionCallback: (locale, supportedLocales) {
        if (kIsWeb) {
          Locale webLocale = Locale(ui.window.locale.languageCode, '');
          print('Weblocale : ${webLocale.toString().substring(0, 2)}');
          for (var locale in supportedLocales.toList()) {
            if (webLocale.languageCode == locale.languageCode) {
              return webLocale;
            }
          }
        } else if (supportedLocales.contains(locale)) {
          return locale;
        }
        return Locale('en', 'US');
      },
      title: 'Flutter Demo',
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('da', 'DK'),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Mr. Mundo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(AppLocalizations.of(context).helloWorld),
            ],
          ),
        ),
      ),
    );
  }
}
