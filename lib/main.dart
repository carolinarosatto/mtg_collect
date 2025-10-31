import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mtg_collect/firebase_options.dart';
import 'package:mtg_collect/repositories/card_repository.dart';
import 'package:mtg_collect/core/services/api_service.dart';
import 'package:mtg_collect/viewmodels/card_viewmodel.dart';
import 'package:mtg_collect/views/widgets/card_list_widget.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  print('Firebase iniciado com sucesso ✅');

  final apiService = ApiService();
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
