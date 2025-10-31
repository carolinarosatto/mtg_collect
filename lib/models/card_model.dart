class CardModel {
  final String name;
  final String id;
  final String? imageUrl;
  final String manaCost;
  final String collectionId;

  CardModel({
    required this.name,
    required this.id,
    this.imageUrl,
    required this.manaCost,
    required this.collectionId,
  });

  factory CardModel.fromMap(Map<String, dynamic> json) {
    final rawUrl = json['image_uris']?['normal'] as String?;

    bool isValidImageUrl(String? url) {
      if (url == null || url.isEmpty) return false;
      final uri = Uri.tryParse(url);
      return uri != null && uri.hasScheme && uri.host.isNotEmpty;
    }

    return CardModel(
      name: json['name'] ?? '',
      id: json['id'] ?? '',
      imageUrl: isValidImageUrl(rawUrl) ? rawUrl : null,
      manaCost: json['mana_cost'] ?? '',
      collectionId: json['collection_id'] ?? '',
    );
  }
}
