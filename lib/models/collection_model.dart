import 'package:cloud_firestore/cloud_firestore.dart';

class CollectionModel {
  final String name;
  final String id;
  final String userId;
  final String format;
  final DateTime createdAt;
  final DateTime? updatedAt;

  CollectionModel({
    required this.name,
    required this.userId,
    required this.id,
    required this.format,
    required this.createdAt,
    this.updatedAt,
  });

  factory CollectionModel.fromMap(String id, Map<String, dynamic> data) {
    return CollectionModel(
      name: data['name'] ?? '',
      id: id,
      userId: data['userId'] ?? '',
      format: data['format'] ?? '',
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'format': format,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
