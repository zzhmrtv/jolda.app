import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const JoldaApp());
}

class JoldaApp extends StatelessWidget {
  const JoldaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'JOLDA',
      theme: const CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xFF3B82F6),
        scaffoldBackgroundColor: Color(0xFFFFFFFF),
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(
            fontFamily: '.SF Pro Display',
            fontSize: 16,
            color: Color(0xFF0F172A),
          ),
        ),
      ),
      home: const RegisterScreen(),
    );
  }
}

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),

              // LOGO
              const Text(
                'JOLDA',
                style: TextStyle(
                  fontSize: 12,
                  letterSpacing: 4,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF3B82F6),
                ),
              ),

              const Spacer(),

              // TITLE
              const Text(
                'Регистрация',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                'Быстрый вход через Google или вручную.',
                style: TextStyle(
                  fontSize: 17,
                  color: Color(0xFF64748B),
                ),
              ),

              const SizedBox(height: 32),

              // INPUTS
              _Input(hint: 'Имя'),
              const SizedBox(height: 16),
              _Input(hint: 'Email'),

              const SizedBox(height: 24),

              // BUTTON
              CupertinoButton(
                borderRadius: BorderRadius.circular(18),
                color: const Color(0xFF3B82F6),
                padding: const EdgeInsets.symmetric(vertical: 18),
                onPressed: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (_) => const StateScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Продолжить',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              const Center(
                child: Text(
                  'Без спама · Без обмана',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF94A3B8),
                  ),
                ),
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class StateScreen extends StatelessWidget {
  const StateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final states = ['New York', 'California', 'Texas', 'Florida'];

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('JOLDA'),
      ),
      child: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(24),
          itemCount: states.length,
          itemBuilder: (_, i) {
            return _Card(
              title: states[i],
              onTap: () {},
            );
          },
        ),
      ),
    );
  }
}

class _Input extends StatelessWidget {
  final String hint;
  const _Input({required this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(18),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CupertinoTextField(
        placeholder: hint,
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: null,
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _Card({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}