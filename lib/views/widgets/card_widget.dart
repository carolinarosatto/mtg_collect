import 'package:flutter/material.dart';
import 'package:mtg_collect/models/card_model.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, required this.card});

  final CardModel card;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: card.imageUrl == null
            ? Image.asset(
                'assets/images/default_card.png',
                width: 50,
                height: 200,
                fit: BoxFit.cover,
              )
            : Image.network(
                card.imageUrl!,
                width: 50,
                height: 150,
                fit: BoxFit.cover,
              ),
        title: Text(card.name),
      ),
    );
  }
}
