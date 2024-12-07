import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  Future<bool> login(String email) async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users?email=$email'));
    return response.statusCode == 200;
  }

  Future<bool> signup(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
      body: json.encode(data),
    );
    return response.statusCode == 201;
  }

  Future<bool> verifyOtp(String otp) async {
    // Simulated OTP verification
    return otp == "1234";
  }
}
