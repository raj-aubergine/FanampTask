import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:internationalization/change_language_provider.dart';
import 'package:internationalization/generated/l10n.dart';
//import 'package:internationalization/generated/l10n.dart';
import 'package:internationalization/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ChangeLanguageProvider>(
      create: (context) => ChangeLanguageProvider(),
      child: Builder(
        builder: (context) => MaterialApp(
          locale: Provider.of<ChangeLanguageProvider>(context, listen: true)
              .currentLocale,
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('hi', 'IN'),
          ],
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          home: Home(),
        ),
      ),
    );
  }
}
