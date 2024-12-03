import 'package:flutter/material.dart';

class ProvidersClass extends ChangeNotifier {
  int counterHelp = 0;

  void increment() {
    counterHelp++;
    notifyListeners();
  }

  void decrement() {
    counterHelp--;
    notifyListeners();
  }
}
