import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool isPassword;

  const CommonTextField({
    required this.label,
    required this.controller,
    this.isPassword = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }
}