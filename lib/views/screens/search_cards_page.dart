import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/card_viewmodel.dart';
import '../widgets/card_widget.dart';

class SearchCardsPage extends StatefulWidget {
  const SearchCardsPage({super.key});

  @override
  State<SearchCardsPage> createState() => _SearchCardsPageState();
}

class _SearchCardsPageState extends State<SearchCardsPage> {
  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CardViewModel>();
    final controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text('Magic: The Gathering Collect')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: 'Buscar Carta',
                suffixIcon: IconButton(
                  onPressed: () {
                    vm.searchCards(controller.text);
                  },
                  icon: const Icon(Icons.search_outlined),
                ),
              ),
            ),
            const SizedBox(height: 16),
            if (vm.isLoading)
              const Center(child: CircularProgressIndicator())
            else if (vm.errorMessage != null)
              Text(vm.errorMessage!, style: const TextStyle(color: Colors.red))
            else if (vm.cards.isEmpty)
              const Text('Nenhuma carta encontrada.')
            else
              Expanded(
                child: ListView.builder(
                  itemCount: vm.cards.length,
                  itemBuilder: (context, index) {
                    final card = vm.cards[index];
                    return CardWidget(card: card);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
