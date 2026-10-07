import 'package:flutter/material.dart';
import '../models/user_profile.dart';
import '../theme/app_theme.dart';
import '../widgets/gradient_button.dart';
import 'login_page.dart';

class ProfilePage extends StatelessWidget {
  final UserProfile userProfile;

  const ProfilePage({
    super.key,
    this.userProfile = const UserProfile(
      username: 'AnimeLover User',
      bio: 'Penggemar anime yang selalu mencari rekomendasi terbaik.',
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text('Profil Saya', style: TextStyle(color: Colors.white, fontSize: 18)),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primary, width: 2),
                ),
                child: const CircleAvatar(
                  radius: 54,
                  backgroundColor: AppColors.surfaceCard,
                  child: Icon(Icons.person, size: 54, color: AppColors.textMuted),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                userProfile.username,
                style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                userProfile.bio,
                textAlign: TextAlign.center,
                style: const TextStyle(color: AppColors.textMuted, fontSize: 14, height: 1.5),
              ),
              const SizedBox(height: 48),
              GradientButton(
                label: 'Log Out',
                gradient: const LinearGradient(colors: [Color(0xFFFF7675), Color(0xFFD63031)]),
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const LoginPage()),
                    (route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}