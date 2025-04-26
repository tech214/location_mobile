import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/actionsButton.dart';
import '../../components/backButton.dart';
import '../../components/favorite_box.dart';
import '../../components/galerie_images.dart';

class LogementDetailsScreen extends StatefulWidget {
  const LogementDetailsScreen({super.key});

  @override
  _LogementDetailsScreenState createState() =>
      _LogementDetailsScreenState();
}

class _LogementDetailsScreenState extends State<LogementDetailsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _slideAnimation = Tween<Offset>(begin: const Offset(0.0, 0.1), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double imageHeight = MediaQuery.of(context).size.height * 0.35;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image de couverture avec animation
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Stack(
                  children: [
                    Container(
                      height: imageHeight,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/sieuwert-otterloo-aren8nutd1Q-unsplash.jpg'),
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
                  ],
                );
              },
            ),

            // Contenu principal avec animation
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Titre et infos principales
                  FadeTransition(
                    opacity: _opacityAnimation,
                    child: Text(
                      'Appartement de Luxe - 3 Chambres',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SlideTransition(
                    position: _slideAnimation,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Nice, France', style: TextStyle(color: Colors.grey[700], fontSize: 16)),
                        const Text('\$350 / nuit', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  FadeTransition(
                    opacity: _opacityAnimation,
                    child: Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 20),
                        const SizedBox(width: 4),
                        Text('4.9 (205 avis)', style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Caractéristiques
                  FadeTransition(
                    opacity: _opacityAnimation,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 12,
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Caractéristiques', style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              OfferIcon(icon: Icons.bed, label: '3 Chambres'),
                              OfferIcon(icon: Icons.bathtub, label: '2 Salles d\'eau'),
                              OfferIcon(icon: Icons.kitchen, label: 'Cuisine équipée'),
                              OfferIcon(icon: Icons.wifi, label: 'Wi-Fi'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Règles de la maison
                  FadeTransition(
                    opacity: _opacityAnimation,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 12,
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Règles de la Maison', style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                           Text(
                            '• Pas d\'animaux\n'
                                '• Pas de fêtes ni d\'événements\n'
                                '• Fumer uniquement à l\'extérieur\n'
                                '• Respectez les voisins\n'
                                '• Heures de silence : 22h - 8h',
                            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Détails supplémentaires
                  FadeTransition(
                    opacity: _opacityAnimation,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        '• Superficie : 100 m²\n'
                            '• Étage : 5ème avec ascenseur\n'
                            '• Vue panoramique sur la mer\n'
                            '• Terrasse privée\n'
                            '• Animaux non admis\n'
                            '• Interdiction de fumer\n'
                            '• Capacité : 6 personnes\n'
                            '• Parking privé',
                        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Services inclus
                  FadeTransition(
                    opacity: _opacityAnimation,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        '• Linge de lit et serviettes\n'
                            '• Produits d’hygiène\n'
                            '• Nettoyage avant et après séjour\n'
                            '• Assistance 24h/24\n'
                            '• Salle de sport\n'
                            '• Piscine extérieure',
                        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Description
                  FadeTransition(
                    opacity: _opacityAnimation,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Cet appartement spacieux est idéal pour les familles et les groupes d\'amis. Situé sur la Côte d\'Azur, il offre une vue imprenable sur la mer et est à quelques minutes des plages et des attractions locales. L\'appartement est entièrement équipé pour garantir un séjour agréable.',
                        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Galerie d'images
                  FadeTransition(
                    opacity: _opacityAnimation,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Galerie d\'images', style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        const SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              GalleryImage(imagePath: 'assets/images/johnson-johnson-U6Q6zVDgmSs-unsplash.jpg'),
                              SizedBox(width: 10),
                              GalleryImage(imagePath: 'assets/images/florian-schmidinger-b_79nOqf95I-unsplash.jpg'),
                              SizedBox(width: 10),
                              GalleryImage(imagePath: 'assets/images/johnson-johnson-U6Q6zVDgmSs-unsplash.jpg'),
                            ],
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

}


// Offre avec icône et étiquette
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
