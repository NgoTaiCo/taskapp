import 'package:flutter/material.dart';
import 'package:taskapp/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter MVVM App',
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
