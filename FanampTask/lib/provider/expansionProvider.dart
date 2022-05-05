import 'package:flutter/material.dart';

class ExpansionProvider extends ChangeNotifier {
  int selected = -1;
  int get getSelected => selected;
  void changeExpansion(int index) {
    selected = index;
    notifyListeners();
  }
}
