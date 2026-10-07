import 'anime_item.dart';

class WatchProgress {
  final AnimeItem anime;
  final int episodeNum;

  const WatchProgress({
    required this.anime,
    required this.episodeNum,
  });

  Map<String, dynamic> toJson() {
    return {
      'anime': anime.toJson(),
      'episodeNum': episodeNum,
    };
  }
}