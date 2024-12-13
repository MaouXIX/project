class Recipe {
  final String label;
  final String imageUrl;
  final String url;
  final int calories;

  Recipe({
    required this.label,
    required this.imageUrl,
    required this.url,
    required this.calories,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      label: json['label'] ?? 'No Title',
      imageUrl: json['image'] ?? '',
      url: json['url'] ?? '',
      calories: (json['calories'] as double).toInt(),
    );
  }
}