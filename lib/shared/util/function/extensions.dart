import 'package:flutter/material.dart';

extension StringX on String {
  String get hardcode => this;
}

extension NumX on num {
  SizedBox get vertical => SizedBox(height: toDouble());
  SizedBox get horizontal => SizedBox(width: toDouble());
}
