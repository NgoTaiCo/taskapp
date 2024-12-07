import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskapp/view_models/auth_view_model.dart';
import 'package:taskapp/widgets/common_button.dart';
import 'package:taskapp/widgets/common_text_field.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              'assets/icons/login_background.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200, left: 27, right: 27),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Welcome to",
                        style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  'assets/icons/logo.png',
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  "Please Sign in or Sign Up in CarbonCap",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 26,
                ),
                const Center(
                  child: Text(
                    "Sign in",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(
                  height: 26,
                ),
                CommonTextField(
                  label: "Enter Your Email",
                  controller: emailController,
                ),
                const SizedBox(
                  height: 26,
                ),
                CommonTextField(
                  label: "Enter Your Password",
                  controller: passwordController,
                  isPassword: true,
                ),
                const SizedBox(
                  height: 26,
                ),
                Row(
                  children: [
                    const Text(
                      "Remember Password",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Consumer(
                      builder: (_, ref, ___) {
                        final viewModel = ref.read(authViewModelProvider);
                        return Checkbox(
                          value: ref.watch(viewModel.rememberAccountRef),
                          onChanged: (value) => ref.read(viewModel.rememberAccountRef.notifier).update(
                                (state) => value ?? false,
                              ),
                        );
                      },
                    ),
                    const Spacer(),
                    const Text(
                      "Forget Password?",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 48,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: CommonButton(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    text: "Sign in",
                    onPressed: () async {
                      final viewModel = ref.read(authViewModelProvider);
                      final result = await viewModel.login(emailController.text);
                      if (result) {
                        if (context.mounted) context.go('/dashboard');
                      }
                    },
                    height: 57,
                    color: const Color(0xFF52BF90),
                    textStyle: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text(
                      "New in CarbonCap?",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () => context.push('/signup'),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF2E7758),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/icons/share.png',
                          fit: BoxFit.cover,
                        ),
                        const Text(
                          "Share",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/icons/facebook.png',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/icons/link.png',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/icons/whatsapp.png',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/icons/instagram.png',
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
