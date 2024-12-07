import 'package:flutter/material.dart';

class CreditRow extends StatelessWidget {
  final String title;
  final Color color;
  final String value;

  const CreditRow({
    required this.title,
    required this.color,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 16),
        SizedBox(
          width: 140,
          child: Text(
            title,
            style: TextStyle(fontSize: 12, color: color),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            color: color,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Center(
              child: Text(
                value,
                style: const TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
