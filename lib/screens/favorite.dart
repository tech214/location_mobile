import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = [
      "Villa Majorelle",
      "Riad El Fenn",
      "Appartement Mer & Soleil"
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mes Favoris"),
        centerTitle: true,
      ),
      body: favorites.isEmpty
          ? const Center(child: Text("Aucun favori pour le moment."))
          : ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) => ListTile(
          leading: const Icon(Icons.favorite, color: Colors.red),
          title: Text(favorites[index]),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {
            // Aller vers les détails du logement
          },
        ),
      ),
    );
  }
}
