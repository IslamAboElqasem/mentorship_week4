class CatModel {
  final String id;
  final String imageUrl;
  final String name;
  final String origin;
  final String lifeSpan;

  CatModel({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.origin,
    required this.lifeSpan,
  });

  factory CatModel.fromJson(Map<String, dynamic> json) {
    final breeds = json['breeds'] as List?;
    final breed = breeds != null && breeds.isNotEmpty ? breeds.first : null;

    return CatModel(
      id: json['id'] ?? '',
      imageUrl: json['url'] ?? '',
      name: breed?['name'] ?? 'Unknown',
      origin: breed?['origin'] ?? 'Unknown',
      lifeSpan: breed?['life_span'] ?? 'N/A',
    );
  }
}
