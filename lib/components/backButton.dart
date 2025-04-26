import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackButtonBox extends StatelessWidget {
  const BackButtonBox({
    Key? key,
    this.bgColor = Colors.white,
    this.iconColor = Colors.black,
    this.onTap,
    this.radius = 50,
    this.size = 24,
    this.padding = 8,
  }) : super(key: key);

  final Color bgColor;
  final Color iconColor;
  final double radius;
  final double size;
  final double padding;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => Get.back(),
      child: Container(
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: bgColor.withOpacity(0.7),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Icon(
          CupertinoIcons.back,
          color: iconColor,
          size: size,
        ),
      ),
    );
  }
}
