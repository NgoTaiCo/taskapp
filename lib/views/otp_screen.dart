import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:taskapp/view_models/auth_view_model.dart';
import 'package:taskapp/widgets/common_button.dart';
import 'package:taskapp/widgets/common_text_field.dart';

class OTPScreen extends ConsumerWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final otpController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('OTP Verification')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Enter the OTP sent to your email',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            CommonTextField(label: 'OTP', controller: otpController),
            const SizedBox(height: 16),
            CommonButton(
              text: 'Verify',
              onPressed: () async {
                final success = await ref
                    .read(authViewModelProvider)
                    .verifyOtp(otpController.text);
                if (success) {
                  context.go('/dashboard');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Invalid OTP!')),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
