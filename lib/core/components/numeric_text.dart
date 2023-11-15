import 'package:flutter/material.dart';

class NumericText extends StatelessWidget {
  final String text;
  
  NumericText.fromInt(int? intValue, {super.key, String? defaultValue}) : text = intValue != null ? intValue.toString() : defaultValue ?? '';
  NumericText.fromDouble(double? doubleValue, {super.key, String? defaultValue}) : text = doubleValue != null ? doubleValue.toString() : defaultValue ?? '';

  @override
  Widget build(BuildContext context) {
    return Text(
      text, 
      style: const TextStyle(fontSize: 16)
    );
  }
}