import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskapp/view_models/auth_view_model.dart';
import '../widgets/common_button.dart';
import '../widgets/common_text_field.dart';
import '../widgets/gender_dropdown_field.dart'; // Import the new GenderDropdownField widget

class SignupScreen extends ConsumerWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();
    final emailController = TextEditingController();
    final addressController = TextEditingController();
    final phoneNumberController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    String? selectedGender;

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/icons/logo.png',
          fit: BoxFit.cover,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CommonTextField(
                  label: 'First name',
                  controller: firstNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CommonTextField(
                  label: 'Last name',
                  controller: lastNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CommonTextField(
                  label: 'Enter your email',
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CommonTextField(
                  label: 'Enter your phone number',
                  controller: phoneNumberController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CommonTextField(
                  label: 'Enter your address',
                  controller: addressController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                GenderDropdownField(
                  label: 'Select gender',
                  selectedGender: selectedGender,
                  onChanged: (value) {
                    selectedGender = value;
                  },
                ),
                const SizedBox(height: 16),
                CommonTextField(
                  label: 'Create your password',
                  controller: passwordController,
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CommonTextField(
                  label: 'Confirm password',
                  controller: confirmPasswordController,
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    } else if (value != passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                Row(
                  children: [
                    Consumer(
                      builder: (_, ref, __) {
                        final viewModel = ref.read(authViewModelProvider);
                        return Checkbox(
                          value: ref.watch(viewModel.rememberAccountRef),
                          onChanged: (value) => ref.read(viewModel.rememberAccountRef.notifier).update(
                                (state) => value ?? false,
                              ),
                        );
                      },
                    ),
                    const SizedBox(width: 5),
                    const Text("I agree with terms and conditions"),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 70),
                  child: CommonButton(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    height: 57,
                    textStyle: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
                    color: const Color(0xFF52BF90),
                    text: 'Sign up',
                    onPressed: () async {
                      // Validate the form
                      if (formKey.currentState?.validate() ?? false) {
                        final success = await ref.read(authViewModelProvider).signup(
                              firstNameController.text,
                              emailController.text,
                              passwordController.text,
                            );
                        if (success) {
                          if (context.mounted) context.go('/otp');
                        } else {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Signup failed!')),
                            );
                          }
                        }
                      }
                    },
                  ),
                ),
                TextButton(
                  onPressed: () => context.go('/'),
                  child: const Text('Already have an account? Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
