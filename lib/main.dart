import 'package:flutter/material.dart';
import 'package:mtg_collect/repositories/card_repository.dart';
import 'package:mtg_collect/services/card_service.dart';
import 'package:mtg_collect/viewmodels/card_viewmodel.dart';
import 'package:mtg_collect/views/widgets/card_list_widget.dart';
import 'package:provider/provider.dart';

void main() {
  final apiService = CardService();
  final repository = CardRepository(apiService);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CardViewModel(repository)),
      ],
      child: const MtgCollectApp(),
    ),
  );
}

class MtgCollectApp extends StatelessWidget {
  const MtgCollectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MTG Collect',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const CardListScreen(),
    );
  }
}
