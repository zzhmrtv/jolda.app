import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const JoldaApp());
}

class JoldaApp extends StatelessWidget {
  const JoldaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterWebScreen(),
    );
  }
}

class RegisterWebScreen extends StatefulWidget {
  const RegisterWebScreen({super.key});

  @override
  State<RegisterWebScreen> createState() => _RegisterWebScreenState();
}

class _RegisterWebScreenState extends State<RegisterWebScreen> {
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
          debugPrint('REGISTER DATA: $data');

          // 👉 ТУТ БУДЕТ:
          // Firebase auth
          // API запрос
          // навигация дальше
        },
      )
      ..loadFlutterAsset('assets/web/register.html');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: WebViewWidget(controller: _controller),
      ),
    );
  }
}
