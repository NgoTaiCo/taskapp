import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskapp/services/auth_service.dart';

final authViewModelProvider = Provider<AuthViewModel>((ref) {
  return AuthViewModel();
});

class AuthViewModel {
  final AuthService _authService = AuthService();

  Future<bool> login(String email) async {
    return await _authService.login(email);
  }

  Future<bool> signup(String name, String email, String password) async {
    return await _authService.signup({
      'name': name,
      'email': email,
      'password': password,
    });
  }

  Future<bool> verifyOtp(String otp) async {
    return await _authService.verifyOtp(otp);
  }
}
