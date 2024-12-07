import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskapp/view_models/auth_view_model.dart';
import 'package:taskapp/widgets/common_button.dart';

class OTPScreen extends ConsumerWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(authViewModelProvider);
    final otpPin = ref.watch(viewModel.otpPinRef);

    void onKeyPress(String key) {
      ref.read(viewModel.otpPinRef.notifier).update((state) {
        for (int i = 0; i < 4; i++) {
          if (state[i].isEmpty) {
            state[i] = key;
            break;
          }
        }
        return List.from(state);
      });
    }

    void onBackspace() {
      ref.read(viewModel.otpPinRef.notifier).update((state) {
        for (int i = 3; i >= 0; i--) {
          if (state[i].isNotEmpty) {
            state[i] = '';
            break;
          }
        }
        return List.from(state);
      });
    }

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
        child: Column(
          children: [
            const Text(
              'Enter the OTP sent to your email',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: otpPin[index].isEmpty ? Colors.white : Colors.blueAccent,
                    border: Border.all(color: Colors.blueAccent, width: 2),
                  ),
                  child: Center(
                    child: Text(
                      otpPin[index],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                );
              }),
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: CommonButton(
                    color: const Color(0xFFEBEBEB),
                    text: 'Resend',
                    textStyle: const TextStyle(color: Colors.black),
                    onPressed: () async {
                      final otp = otpPin.join();
                      final success = await ref.read(authViewModelProvider).verifyOtp(otp);
                      if (success && context.mounted) {
                        context.go('/main');
                      } else {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Invalid OTP!')),
                          );
                        }
                      }
                    },
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: CommonButton(
                    color: const Color(0xFF52BF90),
                    text: 'Verify',
                    onPressed: () async {
                      final otp = otpPin.join();
                      final success = await ref.read(authViewModelProvider).verifyOtp(otp);
                      if (success && context.mounted) {
                        context.go('/main');
                      } else {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Invalid OTP!')),
                          );
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 126 / 55,
              ),
              itemCount: 12,
              itemBuilder: (context, index) {
                if (index == 11) {
                  return GestureDetector(
                    onTap: onBackspace,
                    child: Container(
                      color: Colors.white,
                      child: const Center(
                        child: Icon(
                          Icons.backspace,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  );
                } else if (index == 10) {
                  return GestureDetector(
                    onTap: () => onKeyPress("0"),
                    child: Container(
                      color: Colors.white,
                      child: const Center(
                        child: Text(
                          "0",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                } else if (index == 9) {
                  return const SizedBox();
                } else {
                  String key = (index + 1).toString();
                  return GestureDetector(
                    onTap: () => onKeyPress(key),
                    child: Container(
                      color: Colors.white,
                      child: Center(
                        child: Text(
                          key,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
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
