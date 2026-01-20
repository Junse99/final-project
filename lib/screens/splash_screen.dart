import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2500), () {
      if (mounted) Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundColor: AppColors.white,
              child: Text('🍔', style: TextStyle(fontSize: 60)), // Emoji en lugar de Icon
            ),
            const SizedBox(height: AppSpacing.x6),
            const Text(
              'Foodly',
              style: TextStyle(
                fontSize: 32, 
                fontWeight: FontWeight.bold, 
                color: AppColors.white,
                letterSpacing: 1.2
              ),
            ),
            const SizedBox(height: AppSpacing.x6),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}