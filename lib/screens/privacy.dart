import 'package:flutter/material.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Confidentialité"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.lock_outline),
            title: const Text("Changer le mot de passe"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Tu peux créer cette page plus tard
            },
          ),
          ListTile(
            leading: const Icon(Icons.shield_outlined),
            title: const Text("Conditions d'utilisation"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Afficher une page ou dialogue
            },
          ),
          ListTile(
            leading: const Icon(Icons.verified_user_outlined),
            title: const Text("Politique de confidentialité"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Afficher une page ou dialogue
            },
          ),
        ],
      ),
    );
  }
}
