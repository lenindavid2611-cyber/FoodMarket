import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  int _count = 0;

  int get itemCount => _count;

  void addItem() {
    _count++;
    notifyListeners();
  }
}