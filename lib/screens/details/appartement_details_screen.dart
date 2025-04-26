import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/actionsButton.dart';
import '../../components/backButton.dart';
import '../../components/favorite_box.dart';

class ApartmentDetailsScreen extends StatelessWidget {
  const ApartmentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double imageHeight = MediaQuery.of(context).size.height * 0.35;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image de couverture
            Stack(
                children: [
                  Container(
                    height: imageHeight,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/tierra-mallorca-rgJ1J8SDEAY-unsplash.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
                    ),
                  ),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white.withOpacity(0.7),
                            child: BackButtonBox()
                          ),
                          const Spacer(),
                          CircleAvatar(
                            backgroundColor: Colors.white.withOpacity(0.7),
                            child: FavoriteBox(
                              isFavorited: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]
            ),

            // Contenu principal
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Titre et infos principales
                  Text(
                    'Appartement Moderne - 2 Chambres',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Paris, France', style: TextStyle(color: Colors.grey[700])),
                      const Text('\$110 / nuit', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      SizedBox(width: 4),
                      Text('4.7 (145 avis)'),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Caractéristiques
                  Text('Caractéristiques', style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OfferIcon(icon: Icons.bed, label: '2 Chambres'),
                      OfferIcon(icon: Icons.bathtub, label: '1 Salle d\'eau'),
                      OfferIcon(icon: Icons.kitchen, label: 'Cuisine équipée'),
                      OfferIcon(icon: Icons.wifi, label: 'Wi-Fi'),
                    ],
                  ),

                  const SizedBox(height: 20),
                  // Détails supplémentaires
                  Text('Détails supplémentaires', style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text(
                    '• Superficie : 65 m²\n'
                        '• Étage : 3ème avec ascenseur\n'
                        '• Vue sur cour intérieure\n'
                        '• Balcon\n'
                        '• Animaux non admis\n'
                        '• Interdiction de fumer\n'
                        '• Capacité : 4 personnes',
                  ),

                  const SizedBox(height: 20),
                  // Services inclus
                  Text('Services inclus', style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text(
                    '• Linge de lit et serviettes\n'
                        '• Produits d’hygiène\n'
                        '• Nettoyage avant et après séjour\n'
                        '• Assistance 24h/24',
                  ),

                  const SizedBox(height: 20),
                  // Horaires
                  Text('Horaires', style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text('Check-in : à partir de 15h\nCheck-out : jusqu\'à 11h'),

                  const SizedBox(height: 20),
                  // Description
                  Text('Description', style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text(
                    'Cet appartement lumineux et moderne est situé en plein cœur de Paris. '
                        'Idéal pour les couples ou les familles, il offre tout le confort nécessaire '
                        'pour un séjour agréable, avec un accès facile aux transports, restaurants et lieux touristiques.',
                  ),

                  const SizedBox(height: 20),
                  // Galerie d'images
                  Text('Galerie', style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 120,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        for (var path in [
                          'assets/images/todd-kent-178j8tJrNlc-unsplash.jpg',
                          'assets/images/kara-eads-L7EwHkq1B2s-unsplash.jpg',
                          'assets/images/jacques-bopp-Hh18POSx5qk-unsplash.jpg',
                        ])
                          GestureDetector(
                            onTap: () => _showFullImageDialog(context, path), // Afficher l'image en plein écran
                            child: Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(path, width: 160, fit: BoxFit.cover),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  // Bouton de réservation
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: Center(
                      child: ActionButton(
                        title: 'Réserver',
                        onPressed: () { },
                        backgroundColor: Colors.green,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Méthode pour afficher l'image en plein écran dans un dialogue
  void _showFullImageDialog(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,  // Fond transparent pour l'effet
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.9), // Fond sombre avec opacité
              borderRadius: BorderRadius.circular(16), // Coins arrondis
            ),
            child: InteractiveViewer(
              panEnabled: true, // Permet de déplacer l'image
              minScale: 0.5, // Zoom minimum
              maxScale: 4.0, // Zoom maximum
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain, // S'adapte au conteneur
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class OfferIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const OfferIcon({required this.icon, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 28, color: Colors.blueAccent),
        const SizedBox(height: 4),
        Text(label, textAlign: TextAlign.center, style: const TextStyle(color: Colors.blueAccent)),
      ],
    );
  }
}
