import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LocationSvgIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final String assetPath;

  const LocationSvgIcon({
    Key? key,
    this.size = 20,
    this.color,
    this.assetPath = 'assets/icons/pin.svg',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetPath,
      width: size,
      height: size,
      color: color, // Peut être null si tu veux conserver les couleurs de base du SVG
    );
  }
}
