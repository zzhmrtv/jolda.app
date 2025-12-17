import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel(
        'Flutter',
        onMessageReceived: (message) {
          final data = jsonDecode(message.message);

          // 🔥 ПОЛУЧАЕМ ДАННЫЕ ИЗ HTML
          final String name = data['name'];
          final String email = data['email'];
          final String password = data['password'];
          final String provider = data['provider']; // google / email

          debugPrint('--- REGISTER DATA ---');
          debugPrint('Name: $name');
          debugPrint('Email: $email');
          debugPrint('Password: $password');
          debugPrint('Provider: $provider');

          // 👉 ТУТ:
          // - Firebase Auth
          // - API
          // - Navigation дальше
        },
      )
      ..loadFlutterAsset('assets/web/register.html');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebViewWidget(controller: _controller),
      ),
    );
  }
}
