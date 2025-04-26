import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookmarkButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final double size;
  final Color? color;
  final bool isBookmarked; // <-- Nouvel état !

  const BookmarkButton({
    Key? key,
    this.onPressed,
    this.size = 24,
    this.color,
    this.isBookmarked = false, // <-- Par défaut non-booké
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        isBookmarked
            ? 'assets/icons/bookmarkPlein.svg' // Image remplie
            : 'assets/icons/bookmark.svg',      // Image vide
        width: size,
        height: size,
        color: color,
      ),
    );
  }
}
