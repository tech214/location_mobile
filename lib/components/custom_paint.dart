import 'package:flutter/material.dart';

class ClipPainter extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final height = size.height;
    final width = size.width;

    Path path = Path();

    // Départ en haut à gauche
    path.moveTo(70, 70);

    // Descente verticale à gauche
    path.lineTo(70, height - 70);

    // Grande courbe fluide (gauche vers centre)
    path.quadraticBezierTo(
      width * 0.2, height + 1,  // contrôle plus bas pour du roundness
      width * 0.5, height -7,  // point central plus bas aussi
    );

    // Grande courbe fluide (centre vers droite)
    path.quadraticBezierTo(
      width * 0.8, height,       // contrôle plus haut que le point précédent pour lisser
      width, height - 60,
    );

    // Remonter à droite
    path.lineTo(width, 0);

    // Fermer la forme
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
