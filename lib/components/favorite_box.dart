import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'theme/color.dart';

class FavoriteBox extends StatelessWidget {
  const FavoriteBox({
    Key? key,
    this.bgColor = Colors.white,
    this.onTap,
    this.isFavorited = false,
    this.showBox = true,
    this.borderColor = AppColor.white,
    this.radius = 50,
    this.size = 18,
    this.padding = 8,
    this.iconColor, // 👈 couleur personnalisable quand showBox = true
  }) : super(key: key);

  final Color borderColor;
  final Color? bgColor;
  final bool isFavorited;
  final bool showBox;
  final double radius;
  final double size;
  final double padding;
  final Color? iconColor;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final Color finalIconColor;

    if (!showBox) {
      finalIconColor = AppColor.white;
    } else {
      finalIconColor = iconColor ?? (isFavorited ? AppColor.secondary : AppColor.mainColor);
    }

    Widget icon = SvgPicture.asset(
      isFavorited ? "assets/icons/favorited.svg" : "assets/icons/favorite.svg",
      color: finalIconColor,
      width: size,
      height: size,
    );

    if (!showBox) {
      return GestureDetector(
        onTap: onTap,
        child: icon,
      );
    }

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        padding: EdgeInsets.all(padding),
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: isFavorited ? AppColor.white : (bgColor ?? AppColor.appBgColor),
          border: Border.all(color: borderColor),
          boxShadow: [
            BoxShadow(
              color: AppColor.shadowColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: icon,
      ),
    );
  }
}
