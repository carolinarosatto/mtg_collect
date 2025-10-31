import 'dart:convert';

import 'package:mtg_collect/models/card_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://api.scryfall.com/cards/search';

  Future<List<CardModel>> fetchCards(String query) async {
    final uri = Uri.parse('$baseUrl?q=$query');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      final List data = decoded['data'];
      return data.map((json) => CardModel.fromMap(json)).toList();
    } else {
      throw Exception('Erro ao buscar cartas: ${response.statusCode}');
    }
  }
}
