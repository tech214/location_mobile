import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Welcome",
        ),
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          child: const Text("Texte de test", style: TextStyle(
            fontSize: 25
          ),),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'onTap',
        child: const Icon(Icons.add),
      ),
    );
  }
}