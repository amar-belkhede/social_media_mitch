import 'package:flutter/material.dart';

extension SizedboxHeight on int {
  Widget height() {
    return SizedBox(height: toDouble());
  }

  Widget width() {
    return SizedBox(width: toDouble());
  }
}

extension SnackbarExtension on BuildContext {
  void showSnackBar({required String text}) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(text)));
  }
}
