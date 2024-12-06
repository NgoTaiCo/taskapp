import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:taskapp/views/dashboard_screen.dart';
import 'package:taskapp/views/otp_screen.dart';
import 'package:taskapp/views/signup_screen.dart';

import 'views/login_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignupScreen(),
    ),
    GoRoute(
      path: '/otp',
      builder: (context, state) => const OTPScreen(),
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const DashboardScreen(),
    ),
  ],
);
