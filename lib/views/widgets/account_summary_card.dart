import 'package:flutter/material.dart';
import 'package:taskapp/views/widgets/credit_row.dart';

class AccountSummaryCard extends StatelessWidget {
  const AccountSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            const SizedBox(height: 26),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                color: const Color(0xFFEDF5F6),
              ),
              child: const Column(
                children: [
                  SizedBox(height: 26),
                  CreditRow(title: "Carbon Credits Available", color: Color(0xFF2E7758), value: "20,000(tons of co2)"),
                  SizedBox(height: 4),
                  CreditRow(title: "Carbon Credits Sold", color: Color(0xFF0E46A3), value: "20,000(tons of co2)"),
                  CreditRow(title: "Carbon Credits Earned", color: Color(0xFF2E7758), value: "20,000(tons of co2)"),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 27 / 2,
          left: 28,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 9),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Color(0xFF071952),
            ),
            child: const Text(
              "Account Summary",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
            ),
          ),
        )
      ],
    );
  }
}
