class CardModel {
  final String name;
  final String id;
  final String imageUrl;
  final String manaCost;

  CardModel({
    required this.name,
    required this.id,
    required this.imageUrl,
    required this.manaCost,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    final imageUris = json['image_uris'] ?? {};

    return CardModel(
      name: json['name'] ?? '',
      id: json['id'] ?? '',
      imageUrl: imageUris['normal'] ?? '',
      manaCost: json['mana_cost'] ?? '',
    );
  }
}
