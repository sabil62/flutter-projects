import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Counters extends ChangeNotifier {
  int values = 0;
  void increment() {
    values++;
    notifyListeners();
  }

  void decrement() {
    values--;
    notifyListeners();
  }
}
