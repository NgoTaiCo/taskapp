import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskapp/view_models/auth_view_model.dart';

import '../widgets/common_button.dart';
import '../widgets/common_text_field.dart';


class SignupScreen extends ConsumerWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Signup')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CommonTextField(label: 'Name', controller: nameController),
              const SizedBox(height: 16),
              CommonTextField(label: 'Email', controller: emailController),
              const SizedBox(height: 16),
              CommonTextField(
                label: 'Password',
                controller: passwordController,
                isPassword: true,
              ),
              const SizedBox(height: 16),
              CommonButton(
                text: 'Signup',
                onPressed: () async {
                  final success = await ref.read(authViewModelProvider).signup(
                        nameController.text,
                        emailController.text,
                        passwordController.text,
                      );
                  if (success) {
                    context.go('/otp');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Signup failed!')),
                    );
                  }
                },
              ),
              TextButton(
                onPressed: () => context.go('/'),
                child: const Text('Already have an account? Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
