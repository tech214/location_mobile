import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../components/actionsButton.dart';
import '../components/customeAppBar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reservations',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Arial',
      ),
      home: const BookingsPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

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
      appBar: CustomAppBar(
        title: 'Reservations',
        backgroundColor: Theme.of(context).appBarTheme,
      ),
      body: bookings.isEmpty
          ? const Center(
        child: Text(
          "Aucune réservation pour le moment.",
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      )
          : ListView.builder(
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

class BookingCard extends StatelessWidget {
  final BookingItem booking;

  const BookingCard({super.key, required this.booking});

  Color getStatusColor() {
    switch (booking.status) {
      case BookingStatus.confirmed:
        return Colors.green;
      case BookingStatus.pending:
        return Colors.orange;
      case BookingStatus.cancelled:
        return Colors.redAccent;
    }
  }

  IconData getStatusIcon() {
    switch (booking.status) {
      case BookingStatus.confirmed:
        return Icons.check_circle;
      case BookingStatus.pending:
        return Icons.schedule;
      case BookingStatus.cancelled:
        return Icons.cancel;
    }
  }

  String getStatusText() {
    switch (booking.status) {
      case BookingStatus.confirmed:
        return "Confirmée";
      case BookingStatus.pending:
        return "En attente";
      case BookingStatus.cancelled:
        return "Annulée";
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd MMM yyyy', 'fr_FR');
    final stayDates = "${dateFormat.format(booking.startDate)} → ${dateFormat.format(booking.endDate)}";

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BookingDetailsPage(booking: booking),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white.withOpacity(0.9), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
                  child: Image.asset(
                    booking.imageUrl,
                    height: 220,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: getStatusColor().withOpacity(0.9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      getStatusText(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    booking.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined, size: 20, color: Colors.grey),
                      const SizedBox(width: 6),
                      Text(
                        booking.location,
                        style: const TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today_outlined, size: 20, color: Colors.grey),
                      const SizedBox(width: 6),
                      Text(
                        stayDates,
                        style: const TextStyle(color: Colors.black87, fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BookingDetailsPage extends StatelessWidget {
  final BookingItem booking;

  const BookingDetailsPage({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd MMM yyyy', 'fr_FR');

    return Scaffold(
      appBar: AppBar(
        title: const Text("Détails"),
      ),
      body: ListView(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
            child: Image.asset(
              booking.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  booking.title,
                  style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined, size: 22, color: Colors.grey),
                    const SizedBox(width: 6),
                    Text(
                      booking.location,
                      style: const TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Icon(Icons.date_range, size: 22, color: Colors.grey),
                    const SizedBox(width: 6),
                    Text(
                      "${dateFormat.format(booking.startDate)} → ${dateFormat.format(booking.endDate)}",
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Icon(
                      booking.status == BookingStatus.confirmed
                          ? Icons.check_circle
                          : booking.status == BookingStatus.pending
                          ? Icons.schedule
                          : Icons.cancel,
                      color: booking.status == BookingStatus.confirmed
                          ? Colors.green
                          : booking.status == BookingStatus.pending
                          ? Colors.orange
                          : Colors.redAccent,
                      size: 26,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      booking.status == BookingStatus.confirmed
                          ? "Confirmée"
                          : booking.status == BookingStatus.pending
                          ? "En attente"
                          : "Annulée",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: booking.status == BookingStatus.confirmed
                            ? Colors.green
                            : booking.status == BookingStatus.pending
                            ? Colors.orange
                            : Colors.redAccent,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                ActionButton(
                  title: 'Annuler',
                  onPressed: () { },
                  backgroundColor: Colors.redAccent,
                ),
              ],
            ),
          ),
        ],
      ),
    );
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
