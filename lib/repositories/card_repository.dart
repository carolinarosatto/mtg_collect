import 'package:mtg_collect/models/card_model.dart';
import 'package:mtg_collect/core/services/api_service.dart';

class CardRepository {
  final ApiService api;

  CardRepository(this.api);

  Future<List<CardModel>> getCards(String query) async {
    return await api.fetchCards(query);
  }
}
