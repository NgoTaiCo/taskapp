import 'package:flutter/material.dart';

class GenderDropdownField extends StatelessWidget {
  final String label;
  final String? selectedGender;
  final ValueChanged<String?> onChanged;

  const GenderDropdownField({
    required this.label,
    required this.selectedGender,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedGender,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
      ),
      items: const [
        DropdownMenuItem(
          value: 'Male',
          child: Text('Male'),
        ),
        DropdownMenuItem(
          value: 'Female',
          child: Text('Female'),
        ),
      ],
    );
  }
}
