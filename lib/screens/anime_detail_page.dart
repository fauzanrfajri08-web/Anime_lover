import 'package:flutter/material.dart';
import '../models/anime_item.dart';
import '../theme/app_theme.dart';
import '../widgets/gradient_button.dart';

class AnimeDetailPage extends StatelessWidget {
  final AnimeItem item;

  const AnimeDetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  item.imagePath,
                  width: double.infinity,
                  height: 380,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    height: 380,
                    color: AppColors.surfaceCard,
                    alignment: Alignment.center,
                    child: const Icon(Icons.movie_creation_outlined, color: Colors.white24, size: 48),
                  ),
                ),
                Container(
                  height: 380,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, AppColors.background],
                      stops: [0.5, 1.0],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${item.genre} · ${item.year} · ⭐ ${item.rating} · ${item.duration}',
                    style: const TextStyle(color: AppColors.primaryAccent, fontSize: 13, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Sinopsis',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.synopsis,
                    style: const TextStyle(color: Colors.white70, fontSize: 13, height: 1.6),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Pemeran Utama',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.cast.join(', '),
                    style: const TextStyle(color: AppColors.textMuted, fontSize: 13),
                  ),
                  const SizedBox(height: 32),
                  GradientButton(
                    label: '▶ Tonton Sekarang',
                    onPressed: () {},
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}