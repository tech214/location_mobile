import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookingsPage extends StatelessWidget {
  const BookingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bookings = [
      BookingItem(
        title: "Villa Dar Yasmine",
        imageUrl: "assets/images/florian-schmidinger-b_79nOqf95I-unsplash.jpg",
        location: "Marrakech, Maroc",
        startDate: DateTime(2025, 5, 10),
        endDate: DateTime(2025, 5, 15),
        status: BookingStatus.confirmed,
      ),
      BookingItem(
        title: "Riad Al Mizan",
        imageUrl: "assets/images/johnson-johnson-U6Q6zVDgmSs-unsplash.jpg",
        location: "Fès, Maroc",
        startDate: DateTime(2025, 6, 3),
        endDate: DateTime(2025, 6, 6),
        status: BookingStatus.pending,
      ),
      BookingItem(
        title: "Appartement Corniche",
        imageUrl: "assets/images/kara-eads-L7EwHkq1B2s-unsplash.jpg",
        location: "Casablanca, Maroc",
        startDate: DateTime(2025, 7, 1),
        endDate: DateTime(2025, 7, 4),
        status: BookingStatus.cancelled,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mes Réservations"),
        centerTitle: true,
        elevation: 1,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          final booking = bookings[index];
          return BookingCard(booking: booking);
        },
      ),
    );
  }
}

class BookingCard extends StatefulWidget {
  final BookingItem booking;

  const BookingCard({super.key, required this.booking});

  @override
  _BookingCardState createState() => _BookingCardState();
}

class _BookingCardState extends State<BookingCard> {
  late ValueNotifier<double> _scaleNotifier;

  @override
  void initState() {
    super.initState();
    // Initialisation du ValueNotifier pour gérer l'animation du zoom
    _scaleNotifier = ValueNotifier(1.0);
  }

  @override
  void dispose() {
    _scaleNotifier.dispose();
    super.dispose();
  }

  Color getStatusColor() {
    switch (widget.booking.status) {
      case BookingStatus.confirmed:
        return Colors.green;
      case BookingStatus.pending:
        return Colors.orange;
      case BookingStatus.cancelled:
        return Colors.redAccent;
    }
  }

  IconData getStatusIcon() {
    switch (widget.booking.status) {
      case BookingStatus.confirmed:
        return Icons.check_circle;
      case BookingStatus.pending:
        return Icons.schedule;
      case BookingStatus.cancelled:
        return Icons.cancel;
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd MMM yyyy', 'fr_FR');
    final stayDates = "${dateFormat.format(widget.booking.startDate)} → ${dateFormat.format(widget.booking.endDate)}";

    return GestureDetector(
      onTap: () {
        // Action au clic (ouvrir les détails par exemple)
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 600),
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white.withOpacity(0.85), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 30,
              offset: const Offset(0, 12),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image avec effet zoom/défilement
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ValueListenableBuilder<double>(
                    valueListenable: _scaleNotifier,
                    builder: (context, scale, child) {
                      return Transform.scale(
                        scale: scale, // Effet de zoom dynamique
                        child: Image.asset(
                          widget.booking.imageUrl,
                          height: 250,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          color: Colors.black.withOpacity(0.3),
                          colorBlendMode: BlendMode.darken,
                        ),
                      );
                    },
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.3),
                    height: 250,
                    width: double.infinity,
                  ),
                  Positioned(
                    bottom: 20,
                    child: Text(
                      widget.booking.title,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Card Content avec animation fluide
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Location avec icône élégante
                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined, size: 22, color: Colors.grey),
                      const SizedBox(width: 8),
                      Text(
                        widget.booking.location,
                        style: const TextStyle(color: Colors.grey, fontSize: 17),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Dates de réservation
                  Row(
                    children: [
                      const Icon(Icons.calendar_today_outlined, size: 22, color: Colors.grey),
                      const SizedBox(width: 8),
                      Text(
                        stayDates,
                        style: const TextStyle(color: Colors.black87, fontSize: 17),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Statut avec animation de couleur
                  AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 400),
                    style: TextStyle(
                      color: getStatusColor(),
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                    child: Row(
                      children: [
                        Icon(getStatusIcon(), color: getStatusColor(), size: 26),
                        const SizedBox(width: 8),
                        Text(
                          _statusText(widget.booking.status),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _statusText(BookingStatus status) {
    switch (status) {
      case BookingStatus.confirmed:
        return "Confirmée";
      case BookingStatus.pending:
        return "En attente";
      case BookingStatus.cancelled:
        return "Annulée";
    }
  }
}

enum BookingStatus { confirmed, pending, cancelled }

class BookingItem {
  final String title;
  final String imageUrl;
  final String location;
  final DateTime startDate;
  final DateTime endDate;
  final BookingStatus status;

  BookingItem({
    required this.title,
    required this.imageUrl,
    required this.location,
    required this.startDate,
    required this.endDate,
    required this.status,
  });
}
