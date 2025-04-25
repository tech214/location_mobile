import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VillaDetailsScreen extends StatelessWidget {
  const VillaDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Image en haut (visible mais ne recouvre pas le reste)
          Stack(
            children: [
              SizedBox(
                height: 280,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/florian-schmidinger-b_79nOqf95I-unsplash.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 40,
                left: 16,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
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

          // Le reste du contenu scrollable
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
                      'Villa Azur Paradise',
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Antibes, Côte d\'Azur', style: TextStyle(color: Colors.grey[700])),
                        Text('\$420 / nuit', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: const [
                        Icon(Icons.star, color: Colors.amber),
                        SizedBox(width: 4),
                        Text('4.8 (89 avis)'),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        OfferIcon(icon: Icons.bed, label: '3 Chambres'),
                        OfferIcon(icon: Icons.bathtub, label: '2 Salles d\'eau'),
                        OfferIcon(icon: Icons.pool, label: 'Piscine'),
                        OfferIcon(icon: Icons.wifi, label: 'Wi-Fi'),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Description',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Nichée au cœur de la Côte d\'Azur, cette villa luxueuse vous offre un cadre idyllique avec piscine privée, cuisine équipée, jardin méditerranéen et une vue panoramique. Parfaite pour les familles ou les couples.',
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Galerie',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 120,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset('assets/images/frames-for-your-heart-mR1CIDduGLc-unsplash.jpg', width: 160, fit: BoxFit.cover),
                          ),
                          const SizedBox(width: 12),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset('assets/images/frames-for-your-heart-mR1CIDduGLc-unsplash.jpg', width: 160, fit: BoxFit.cover),
                          ),
                          const SizedBox(width: 12),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset('assets/images/frames-for-your-heart-mR1CIDduGLc-unsplash.jpg', width: 160, fit: BoxFit.cover),
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
                        onPressed: () {
                          // aller vers la page de réservation
                        },
                        child: const Text('Réserver maintenant'),
                      ),
                    ),
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
        Text(label),
      ],
    );
  }
}
