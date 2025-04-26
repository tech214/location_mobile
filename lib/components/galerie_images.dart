import 'package:flutter/material.dart';

class GalleryImage extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;
  final double borderRadius;

  const GalleryImage({
    Key? key,
    required this.imagePath,
    this.width = 120,
    this.height = 120,
    this.borderRadius = 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => Dialog(
            backgroundColor: Colors.transparent,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: InteractiveViewer(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(borderRadius),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Image.asset(
          imagePath,
          width: width,
          height: height,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
