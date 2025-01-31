import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Welcome",
        ),
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          child: Text("Texte de test", style: TextStyle(
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