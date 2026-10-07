class UserProfile {
  final String username;
  final String bio;
  final String? avatarUrl;

  const UserProfile({
    required this.username,
    required this.bio,
    this.avatarUrl,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      username: json['username'] ?? '',
      bio: json['bio'] ?? '',
      avatarUrl: json['avatarUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'bio': bio,
      'avatarUrl': avatarUrl,
    };
  }
}