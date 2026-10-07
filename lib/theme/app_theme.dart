import 'package:flutter/material.dart';

class AppColors {
  // Background & Surface
  static const Color background = Color(0xFF0D0F18);
  static const Color surfaceCard = Color(0xFF1A1D2D);
  static const Color surface = Color(0xFF1A1D2D); // Ditambahkan untuk login_page
  static const Color inputBg = Color(0xFF252942);

  // Core Colors
  static const Color primary = Color(0xFFE50914); 
  static const Color primaryAccent = Color(0xFF9C27B0);

  // Typography
  static const Color textMain = Colors.white;
  static const Color textDark = Colors.black;
  static const Color textMuted = Colors.white54; 

  // Gradients
  static const LinearGradient buttonGradient = LinearGradient(
    colors: [Color(0xFFE50914), Color(0xFFB71C1C)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  // Ditambahkan untuk efek bayangan di atas gambar background login
  static const LinearGradient bannerGradient = LinearGradient(
    colors: [Colors.transparent, Color(0xFF0D0F18)], 
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}