import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:location_mobile/firebase_options.dart';
import 'package:location_mobile/screens/home/home_screen.dart';
import 'package:location_mobile/themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.system,
      home:  HomePage(),
    );
  }
}
