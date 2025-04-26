import 'package:flutter/material.dart';
import 'package:location_mobile/components/theme/color.dart';
import '../themes/app_theme.dart'; // Pour utiliser les polices et couleurs de ton thème

enum AppTextType {
  title,
  body,
  caption,
  small,
}

class AppText extends StatelessWidget {
  final String text;
  final AppTextType type;
  final Color? color;
  final TextAlign? align;
  final int? maxLines;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;

  const AppText({
    super.key,
    required this.text,
    this.type = AppTextType.body,
    this.color,
    this.align,
    this.maxLines,
    this.overflow,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align ?? TextAlign.start,
      maxLines: maxLines,
      overflow: overflow,
      style: _getTextStyle(context),
    );
  }

  TextStyle _getTextStyle(BuildContext context) {
    switch (type) {
      case AppTextType.title:
        return AppThemes.primaryFontStyle.copyWith(
          fontSize: 24,
          fontWeight: fontWeight ?? FontWeight.bold,
          color: color ?? AppColor.textColor,
        );
      case AppTextType.body:
        return AppThemes.primaryFontStyle.copyWith(
          fontSize: 16,
          fontWeight: fontWeight ?? FontWeight.normal,
          color: color ?? AppColor.textColor,
        );
      case AppTextType.caption:
        return AppThemes.secondaryFontStyle.copyWith(
          fontSize: 12,
          fontWeight: fontWeight ?? FontWeight.w400,
          color: color ?? AppColor.labelColor,
        );
      case AppTextType.small:
        return AppThemes.secondaryFontStyle.copyWith(
          fontSize: 10,
          fontWeight: fontWeight ?? FontWeight.w300,
          color: color ?? AppColor.labelColor,
        );
      default:
        return AppThemes.primaryFontStyle.copyWith(
          fontSize: 16,
          color: color ?? AppColor.textColor,
        );
    }
  }
}
