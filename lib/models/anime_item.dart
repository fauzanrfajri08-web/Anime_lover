class AnimeItem {
  final String title;
  final String imagePath;
  final String genre;
  final int year;
  final String rating;
  final String duration;
  final String synopsis;
  final List<String> cast;

  const AnimeItem({
    required this.title,
    required this.imagePath,
    required this.genre,
    required this.year,
    required this.rating,
    required this.duration,
    required this.synopsis,
    required this.cast,
  });

  factory AnimeItem.fromJson(Map<String, dynamic> json) {
    return AnimeItem(
      title: json['title'] ?? '',
      imagePath: json['imagePath'] ?? '',
      genre: json['genre'] ?? '',
      year: json['year'] ?? 0,
      rating: json['rating'] ?? '',
      duration: json['duration'] ?? '',
      synopsis: json['synopsis'] ?? '',
      cast: List<String>.from(json['cast'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'imagePath': imagePath,
      'genre': genre,
      'year': year,
      'rating': rating,
      'duration': duration,
      'synopsis': synopsis,
      'cast': cast,
    };
  }

  AnimeItem copyWith({
    String? title,
    String? imagePath,
    String? genre,
    int? year,
    String? rating,
    String? duration,
    String? synopsis,
    List<String>? cast,
  }) {
    return AnimeItem(
      title: title ?? this.title,
      imagePath: imagePath ?? this.imagePath,
      genre: genre ?? this.genre,
      year: year ?? this.year,
      rating: rating ?? this.rating,
      duration: duration ?? this.duration,
      synopsis: synopsis ?? this.synopsis,
      cast: cast ?? this.cast,
    );
  }
}