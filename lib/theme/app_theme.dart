import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFFFF5722);
  static const Color secondary = Color(0xFFFFC107);
  static const Color textDark = Color(0xFF212121);
  static const Color textLight = Color(0xFF757575);
  static const Color bgLight = Color(0xFFFAFAFA);
  static const Color white = Colors.white;
}

class AppSpacing {
  static const double x1 = 4.0;
  static const double x2 = 8.0;
  static const double x4 = 16.0;
  static const double x6 = 24.0;
  static const double x8 = 32.0;
}

class AppTextStyles {
  static const TextStyle h1 = TextStyle(
    fontSize: 28, 
    fontWeight: FontWeight.bold, 
    color: AppColors.textDark, 
    fontFamily: 'Inter', // Corregido: antes decía family
  );
  
  static const TextStyle h2 = TextStyle(
    fontSize: 20, 
    fontWeight: FontWeight.w600, 
    color: AppColors.textDark, 
    fontFamily: 'Inter',
  );
  
  static const TextStyle bodyMedium = TextStyle(
    fontSize: 16, 
    fontWeight: FontWeight.w500, 
    color: AppColors.textDark, 
    fontFamily: 'Inter',
  );
  
  static const TextStyle bodyRegular = TextStyle(
    fontSize: 14, 
    fontWeight: FontWeight.normal, 
    color: AppColors.textLight, 
    fontFamily: 'Inter',
  );
  
  static const TextStyle price = TextStyle(
    fontSize: 24, 
    fontWeight: FontWeight.bold, 
    color: AppColors.secondary, 
    fontFamily: 'Inter',
  );
}