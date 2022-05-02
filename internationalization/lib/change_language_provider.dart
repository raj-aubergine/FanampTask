import 'package:flutter/cupertino.dart';

class ChangeLanguageProvider with ChangeNotifier {
  Locale currentLocale = new Locale("en");

  Locale get _currentLocale => currentLocale;

  void changeLocale(String locale) {
    this.currentLocale = new Locale(locale);
    notifyListeners();
  }
}
