import 'package:flutter/material.dart';
import 'dart:math';

class PopularPage extends StatelessWidget {
  final List populars;

  const PopularPage({super.key, required this.populars});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Populaires", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: populars.length,
        itemBuilder: (context, index) {
          final item = populars[index];
          return TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 1),
            duration: Duration(milliseconds: 500 + index * 100),
            builder: (context, value, child) {
              return Transform(
                transform: Matrix4.rotationZ(pi * (1 - value) * 0.02),
                child: Opacity(
                  opacity: value,
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: const EdgeInsets.only(bottom: 20),
                    elevation: 6, // Slight elevation for a clean shadow effect
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                          child: Image.network(
                            item["image"],
                            height: 180,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item["name"],
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Colors.deepPurple,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.orangeAccent,
                                        size: 18,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        item["rate"],
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Add action button for more options or details
                                  IconButton(
                                    icon: const Icon(
                                      Icons.more_vert,
                                      color: Colors.deepPurple,
                                    ),
                                    onPressed: () {
                                      // Handle additional actions here
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
