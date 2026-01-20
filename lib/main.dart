import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/product_detail_screen.dart';
import 'theme/app_theme.dart';

void main() => runApp(const FoodlyApp());

class FoodlyApp extends StatelessWidget {
  const FoodlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foodly App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.bgLight,
        primaryColor: AppColors.primary,
        fontFamily: 'Inter',
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const SplashScreen(),
        '/home': (_) => const HomeScreen(),
      },
      // Usamos onGenerateRoute para pasar argumentos al detalle
      onGenerateRoute: (settings) {
        if (settings.name == '/detail') {
          final args = settings.arguments as Map<String, String>;
          return MaterialPageRoute(
            builder: (_) => ProductDetailScreen(product: args),
          );
        }
        return null;
      },
    );
  }
}