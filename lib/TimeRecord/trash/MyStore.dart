import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class MyStore extends ChangeNotifier {
  var name = 'john kim';
  var num = 20;

  int _age = 0;

  int get age {
    return _age;
  }

  void set age(int a) {
    _age = a;
    notifyListeners();
  }

  setNum(n) {
    num = n;
    notifyListeners();
  }

  addNum() {
    num++;
    notifyListeners();
  }
}
