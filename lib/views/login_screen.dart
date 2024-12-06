import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskapp/view_models/auth_view_model.dart';

import '../widgets/common_button.dart';
import '../widgets/common_text_field.dart';


class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CommonTextField(label: 'Email', controller: emailController),
            const SizedBox(height: 16),
            CommonButton(
              text: 'Login',
              onPressed: () async {
                final success =
                    await ref.read(authViewModelProvider).login(emailController.text);
                if (success) {
                  context.go('/dashboard');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Login failed!')),
                  );
                }
              },
            ),
            TextButton(
              onPressed: () => context.go('/signup'),
              child: const Text('Don\'t have an account? Signup'),
            ),
          ],
        ),
      ),
    );
  }
}
