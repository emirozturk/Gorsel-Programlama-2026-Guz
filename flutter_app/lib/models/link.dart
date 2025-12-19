import 'tag.dart';

class Link {
  final int id;
  final String url;
  final String title;
  final String? description;
  final int userId;
  final DateTime createdAt;
  final List<Tag> tags;

  Link({
    required this.id,
    required this.url,
    required this.title,
    this.description,
    required this.userId,
    required this.createdAt,
    this.tags = const [],
  });

  factory Link.fromJson(Map<String, dynamic> json) {
    return Link(
      id: json['id'],
      url: json['url'],
      title: json['title'],
      description: json['description'],
      userId: json['userId'],
      createdAt: DateTime.parse(json['createdAt']),
      tags: (json['tags'] as List<dynamic>?)
              ?.map((tag) => Tag.fromJson(tag))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
      'title': title,
      'description': description,
      'userId': userId,
      'createdAt': createdAt.toIso8601String(),
      'tags': tags.map((tag) => tag.toJson()).toList(),
    };
  }
}
