import 'package:flutter/material.dart';
import 'package:login_app/core/theme/app_theme.dart';
import 'package:login_app/views/screens/login/login_screen.dart';

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login APP',
      themeMode: ThemeMode.light,
      theme: lightTheme,
      darkTheme: darkTheme,
      routes: {
        '/': (context) => const LoginScreen(),
      },
      initialRoute: '/',
    );
  }
}