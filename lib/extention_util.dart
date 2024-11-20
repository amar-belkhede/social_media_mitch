import 'package:flutter/material.dart';

extension SizedboxHeight on int {
  Widget height() {
    return SizedBox(height: toDouble());
  }

  Widget width() {
    return SizedBox(width: toDouble());
  }
}
