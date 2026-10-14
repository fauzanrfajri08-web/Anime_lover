import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/animated_entrance.dart';
import '../widgets/social_icon_button.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Tentang Pembuat',
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Bagian Foto / Avatar Pembuat dengan Animasi Masuk
           // Bagian Foto / Avatar Pembuat dengan Animasi Masuk
AnimatedEntrance(
  beginOffset: const Offset(0, -0.2),
  duration: const Duration(milliseconds: 500),
  child: Center(
    child: Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.primaryAccent],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.4),
            blurRadius: 20,
            spreadRadius: 2,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipOval(
        child: Image.asset(
          'assets/images/Profile Guweh.jpg', // Path foto profil Anda
          width: 120,
          height: 120,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            // Jika foto gagal dimuat, akan tampil ikon default ini
            return Container(
              width: 120,
              height: 120,
              color: AppColors.surfaceCard,
              child: const Icon(Icons.person_rounded, size: 65, color: Colors.white70),
            );
          },
        ),
      ),
    ),
  ),
),
            const SizedBox(height: 20),

            // Nama & Peran / Title
            AnimatedEntrance(
              delay: const Duration(milliseconds: 100),
              child: Column(
                children: const [
                  Text(
                    'Fauzan Ramdhani Fajri',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Lead Flutter Developer & UI/UX Enthusiast',
                    style: TextStyle(
                      color: AppColors.primaryAccent,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Kartu Informasi Biodata / Latar Belakang
            AnimatedEntrance(
              delay: const Duration(milliseconds: 200),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.surfaceCard,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white.withOpacity(0.08)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Biografi Singkat',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Halo! Saya adalah mahasiswa yang berfokus pada pengembangan aplikasi lintas platform menggunakan Flutter dan Dart. '
                      'Aplikasi AnimeLover ini dikembangkan sebagai implementasi proyek tugas Pemrograman Berbasis Platform (PBP) dengan menerapkan prinsip antarmuka modern, navigasi dinamis, serta pengelolaan data yang bersih.',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Kartu Keterampilan / Teknologi yang Digunakan
            AnimatedEntrance(
              delay: const Duration(milliseconds: 300),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.surfaceCard,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white.withOpacity(0.08)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Keahlian & Teknologi',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: const [
                        _TechChip(label: 'Flutter'),
                        _TechChip(label: 'Dart'),
                        _TechChip(label: 'UI/UX Design'),
                        _TechChip(label: 'State Management'),
                        _TechChip(label: 'Responsive Layout'),
                        _TechChip(label: 'Git & GitHub'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Tautan Sosial Media / Kontak
            AnimatedEntrance(
              delay: const Duration(milliseconds: 400),
              child: Column(
                children: [
                  const Text(
                    'Hubungi Saya',
                    style: TextStyle(
                      color: AppColors.textMuted,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SocialIconButton(
                        icon: Icons.code_rounded,
                        color: Colors.white,
                      ),
                      SizedBox(width: 16),
                      SocialIconButton(
                        icon: Icons.business_center_rounded,
                        color: Color(0xFF0A66C2), // LinkedIn Color
                      ),
                      SizedBox(width: 16),
                      SocialIconButton(
                        icon: Icons.mail_outline_rounded,
                        color: Color(0xFFEA4335), // Email Color
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

// Widget pendukung untuk menampilkan label chip teknologi
class _TechChip extends StatelessWidget {
  final String label;

  const _TechChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primary.withOpacity(0.3)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}