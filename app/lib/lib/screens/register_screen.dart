import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/input_field.dart';
import '../widgets/primary_button.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'JOLDA',
                style: TextStyle(
                  letterSpacing: 6,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),
              const Spacer(),
              const Text(
                'Регистрация',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w800,
                  color: AppColors.text,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Быстро и без лишнего',
                style: TextStyle(color: AppColors.muted),
              ),
              const SizedBox(height: 32),
              const InputField('Имя'),
              const SizedBox(height: 16),
              const InputField('Email'),
              const SizedBox(height: 32),
              PrimaryButton(
                text: 'Продолжить',
                onTap: () {
                  // позже → переход к штату
                },
              ),
              const Spacer(flex: 2),
              const Center(
                child: Text(
                  'Без спама · Без обмана',
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.muted,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}