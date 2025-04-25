import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panorama_viewer/panorama_viewer.dart';

class HotelDetailsScreen extends StatelessWidget {
  const HotelDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Partie panoramique (hauteur fixe)
          SizedBox(
            height: 250,
            width: double.infinity,
            child: Stack(
              children: [
                PanoramaViewer(
                  child: Image.asset(
                    'assets/images/sieuwert-otterloo-aren8nutd1Q-unsplash.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Get.back(),
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 16,
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.favorite_border, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),

          // Partie détails scrollable
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hôtel Grand Riviera',
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Nice, Côte d\'Azur', style: TextStyle(color: Colors.grey[700])),
                        const Text('\$180 / nuit', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber),
                        SizedBox(width: 4),
                        Text('4.5 (321 avis)'),
                      ],
                    ),
                    const SizedBox(height: 20),

                    Text('Équipements', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        OfferIcon(icon: Icons.king_bed, label: 'Lit King'),
                        OfferIcon(icon: Icons.ac_unit, label: 'Climatisé'),
                        OfferIcon(icon: Icons.restaurant, label: 'Petit-déj.'),
                        OfferIcon(icon: Icons.local_parking, label: 'Parking'),
                      ],
                    ),
                    const SizedBox(height: 20),

                    Text('Services de l\'hôtel', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    const Text(
                      '• Réception 24h/24\n'
                          '• Service de chambre\n'
                          '• Wifi gratuit\n'
                          '• Blanchisserie\n'
                          '• Spa & Salle de sport\n'
                          '• Bar / Restaurant\n'
                          '• Navette aéroport',
                    ),
                    const SizedBox(height: 20),

                    Text('Horaires', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    const Text('Check-in : à partir de 14h\nCheck-out : jusqu\'à 11h'),
                    const SizedBox(height: 20),

                    Text('Description', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    const Text(
                      'Situé à deux pas de la promenade des Anglais, l’Hôtel Grand Riviera vous propose des chambres luxueuses avec une vue imprenable sur la mer, un service de qualité et toutes les commodités pour un séjour inoubliable.',
                    ),
                    const SizedBox(height: 20),

                    Text('Galerie', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 120,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          for (var path in [
                            'assets/images/kara-eads-L7EwHkq1B2s-unsplash.jpg',
                            'assets/images/kara-eads-L7EwHkq1B2s-unsplash.jpg',
                            'assets/images/kara-eads-L7EwHkq1B2s-unsplash.jpg',
                          ])
                            Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(path, width: 160, fit: BoxFit.cover),
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),

                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: () {},
                        child: const Text('Réserver maintenant'),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
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
        Icon(icon, size: 28),
        const SizedBox(height: 4),
        Text(label, textAlign: TextAlign.center),
      ],
    );
  }
}
