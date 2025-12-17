import 'package:flutter/material.dart';

void main() {
  runApp(const JoldaApp());
}

class JoldaApp extends StatelessWidget {
  const JoldaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JOLDA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'System',
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: const RegisterScreen(),
    );
  }
}

/* ---------------- REGISTER ---------------- */

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedPage(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 80, 24, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'JOLDA',
              style: TextStyle(
                fontSize: 12,
                letterSpacing: 4,
                color: Color(0xFF3B82F6),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 80),
            const Text(
              'Регистрация',
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 12),
            const Text(
              'Быстрый вход через Google или вручную.',
              style: TextStyle(fontSize: 17, color: Color(0xFF475569)),
            ),
            const SizedBox(height: 24),

            _input('Имя'),
            _input('Email'),

            const Spacer(),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3B82F6),
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  _route(const StateScreen()),
                );
              },
              child: const Text(
                'Продолжить',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 12),
            const Center(
              child: Text(
                'Без спама · Без обмана',
                style: TextStyle(fontSize: 13, color: Color(0xFF94A3B8)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* ---------------- STATE ---------------- */

class StateScreen extends StatelessWidget {
  const StateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final states = ['New York', 'California', 'Texas', 'Florida'];

    return AnimatedPage(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 40, 24, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _topBar(context),
            const SizedBox(height: 60),
            const Text(
              'Штат',
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 12),
            const Text(
              'Где ты сейчас?',
              style: TextStyle(fontSize: 17, color: Color(0xFF475569)),
            ),
            const SizedBox(height: 24),
            ...states.map(
              (s) => _card(
                s,
                () => Navigator.push(
                  context,
                  _route(CityScreen(state: s)),
                ),
              ),
            ),
            const Spacer(),
            const Center(
              child: Text(
                'Можно изменить позже',
                style: TextStyle(fontSize: 13, color: Color(0xFF94A3B8)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* ---------------- CITY ---------------- */

class CityScreen extends StatelessWidget {
  final String state;
  const CityScreen({super.key, required this.state});

  static const cities = {
    'New York': ['New York City', 'Brooklyn', 'Queens'],
    'California': ['Los Angeles', 'San Diego', 'San Jose'],
    'Texas': ['Houston', 'Dallas', 'Austin'],
    'Florida': ['Miami', 'Orlando', 'Tampa'],
  };

  @override
  Widget build(BuildContext context) {
    return AnimatedPage(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 40, 24, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _topBar(context),
            const SizedBox(height: 60),
            const Text(
              'Город',
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            Text(
              'Штат: $state',
              style: const TextStyle(fontSize: 17, color: Color(0xFF475569)),
            ),
            const SizedBox(height: 24),
            ...cities[state]!.map(
              (c) => _card(c, () {}),
            ),
            const Spacer(),
            const Center(
              child: Text(
                'Последний шаг',
                style: TextStyle(fontSize: 13, color: Color(0xFF94A3B8)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* ---------------- COMPONENTS ---------------- */

Widget _input(String hint) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: TextField(
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
        ),
      ),
    ),
  );
}

Widget _card(String text, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE2E8F0)),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(text, style: const TextStyle(fontSize: 18)),
    ),
  );
}

Widget _topBar(BuildContext context) {
  return Row(
    children: [
      GestureDetector(
        onTap: () => Navigator.pop(context),
        child: const Text(
          '← Назад',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF2563EB),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      const Spacer(),
      const Text(
        'JOLDA',
        style: TextStyle(
          fontSize: 12,
          letterSpacing: 4,
          color: Color(0xFF3B82F6),
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}

/* ---------------- ANIMATION ---------------- */

class AnimatedPage extends StatelessWidget {
  final Widget child;
  const AnimatedPage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 350),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (_, double v, __) => Opacity(
        opacity: v,
        child: Transform.translate(
          offset: Offset(0, (1 - v) * 16),
          child: child,
        ),
      ),
    );
  }
}

Route _route(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (_, __, ___) => page,
    transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
  );
}