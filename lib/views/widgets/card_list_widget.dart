import 'package:flutter/material.dart';
import 'package:mtg_collect/viewmodels/card_viewmodel.dart';
import 'package:provider/provider.dart';

class CardListScreen extends StatefulWidget {
  const CardListScreen({super.key});

  @override
  State<CardListScreen> createState() => _CardListScreenState();
}

class _CardListScreenState extends State<CardListScreen> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CardViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Magic: The Gathering')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Buscar carta',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    vm.searchCards(_controller.text);
                  },
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
                    return ListTile(
                      leading: Image.network(
                        card.imageUrl,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(card.name),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
