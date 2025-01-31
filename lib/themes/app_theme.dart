import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {

  // Couleurs principales
  static const Color primaryColor = Color(0xFF1E355F);
  static const Color secondaryColor = Color(0xFFFBCF84);
  static const Color backgroundColorLight = Color(0xFFECFAFF);
  static const Color backgroundColorDark = Color(0xFFDDB26A);
  static const Color dangerColor = Color(0xFFD91E23);
  static const Color greenDark = Color(0xFF0D9723);
  static const Color blueVerified = Color(0xFF0F62DF);
  static const Color yellow = Color(0xFFF9A825);
  static LinearGradient getGradient(List<Color> colors) {
    return LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, stops: const [0.1, 0.4, 0.6, 0.95, 1], colors: colors);
  }



  // Définir la police avec Google Fonts
  static TextStyle primaryFontStyle = GoogleFonts.roboto();
  static TextStyle secondaryFontStyle = GoogleFonts.lato();




  // Theme clair
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColorLight,



    // Police
    fontFamily: 'Roboto',


    // AppBar du mode clair
    appBarTheme: const AppBarTheme(color: secondaryColor, iconTheme: IconThemeData(color: primaryColor), titleTextStyle: TextStyle(color: primaryColor, fontSize: 28, fontWeight: FontWeight.bold, fontFamily: 'Roboto',),),



    // Text theme du mode clair
    textTheme: TextTheme(bodyLarge: primaryFontStyle.copyWith(color: primaryColor, fontSize: 16), bodyMedium: primaryFontStyle.copyWith(color: primaryColor, fontSize: 14), titleLarge: primaryFontStyle.copyWith(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 24),),




    // Button theme en mode clair
    buttonTheme: const ButtonThemeData(buttonColor: secondaryColor,),



    // Floating Action Button thème clair
    floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: secondaryColor, foregroundColor: primaryColor,),

    // Color Scheme
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: secondaryColor, background: backgroundColorLight, onBackground: primaryColor,),);




  // Theme sombre
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    hintColor: secondaryColor,
    scaffoldBackgroundColor: primaryColor,
    fontFamily: 'Roboto',




    // AppBar du mode sombre
    appBarTheme: const AppBarTheme(
      color: primaryColor,
      iconTheme: IconThemeData(color: backgroundColorDark),
      titleTextStyle: TextStyle(
        color: secondaryColor,
        fontSize: 28,
        fontWeight: FontWeight.bold,
        fontFamily: 'Roboto',
      ),
    ),




    // Text theme du mode sombre (Inverser les couleurs des textes)
    textTheme: TextTheme(
      bodyLarge: secondaryFontStyle.copyWith(color: secondaryColor, fontSize: 16), // Textes en clair
      bodyMedium: secondaryFontStyle.copyWith(color: secondaryColor, fontSize: 14),
      titleLarge: primaryFontStyle.copyWith(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 24),
    ),




    // Button theme en mode sombre
    buttonTheme: const ButtonThemeData(
      buttonColor: secondaryColor,
    ),




    // Floating Action Button thème sombre
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: secondaryColor,
      foregroundColor: primaryColor,
    ),



    // Color Scheme
    colorScheme: const ColorScheme.dark().copyWith(
      background: backgroundColorDark,
      secondary: secondaryColor,
      onBackground: backgroundColorLight,
    ),
  );


  // Fonction pour ajouter des icônes personnalisées dans les boutons, par exemple :
  static Icon getActionIcon(String action) {
    switch (action) {
      case 'heart':
        return const Icon(Icons.favorite, color: primaryColor);
      case 'search':
        return const Icon(Icons.search, color: primaryColor);
      default:
        return const Icon(Icons.home, color: primaryColor);
    }
  }

  // Fonction pour ajouter un bouton avec couleur de danger
  static ElevatedButton dangerButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: dangerColor),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
