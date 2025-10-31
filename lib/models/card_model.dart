class CardModel {
  final String name;
  final String id;
  final String imageUrl;
  final String manaCost;
  final String collectionId;

  CardModel({
    required this.name,
    required this.id,
    required this.imageUrl,
    required this.manaCost,
    required this.collectionId,
  });

  factory CardModel.fromMap(Map<String, dynamic> json) {
    final imageUris = json['image_uris'] ?? {};

    return CardModel(
      name: json['name'] ?? '',
      id: json['id'] ?? '',
      imageUrl: imageUris['normal'] ?? '',
      manaCost: json['mana_cost'] ?? '',
      collectionId: json['collection_id'] ?? '',
    );
  }
}
