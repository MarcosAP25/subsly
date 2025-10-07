import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {

    final textBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    );

    final decorationStyle = InputDecoration(
      border: textBorder,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    );

    return TextFormField(
      decoration: decorationStyle,
    );
  }
}