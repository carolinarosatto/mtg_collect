import 'package:flutter/material.dart';
import 'package:mtg_collect/models/card_model.dart';
import 'package:mtg_collect/repositories/card_repository.dart';

class CardViewModel extends ChangeNotifier {
  final CardRepository repository;

  CardViewModel(this.repository);

  List<CardModel> cards = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> searchCards(String query) async {
    if (query.isEmpty) return;

    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final result = await repository.getCards(query);
      cards = result;
    } catch (e) {
      errorMessage = 'Erro ao buscar cartas. Tente novamente.';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void clearResults() {
    cards = [];
    notifyListeners();
  }
}
