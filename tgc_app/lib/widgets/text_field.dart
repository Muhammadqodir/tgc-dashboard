import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.margin = const EdgeInsets.all(12),
    this.obscureText = false,
    required this.label,
    required this.onChange,
  });

  final Function(String) onChange;
  final TextEditingController controller;
  final EdgeInsets margin;
  final bool obscureText;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: TextField(
        controller: controller,
        onChanged: onChange,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
        ),
      ),
    );
  }
}
