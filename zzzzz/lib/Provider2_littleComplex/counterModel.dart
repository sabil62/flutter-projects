import 'package:flutter/cupertino.dart';

class CounterModel extends ChangeNotifier {
  int jobs = 15;
  String name = 'lion';
  int salary = 30000;
  void incrementJobs() {
    jobs++;
    notifyListeners();
  }

  void decrementJobs() {
    jobs--;
    notifyListeners();
  }

  void incrementSalary({int increments = 1000}) {
    salary = salary + increments;
    notifyListeners();
  }

  void decrememtSalary({int decrement = 1000}) {
    salary = salary - decrement;
    notifyListeners();
  }
}
