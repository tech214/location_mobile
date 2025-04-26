import 'package:flutter/material.dart';

class GeneralSettingsPage extends StatelessWidget {
  const GeneralSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Paramètres Généraux"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text("Notifications"),
            subtitle: const Text("Activer les notifications"),
            value: true,
            onChanged: (value) {},
          ),
          ListTile(
            title: const Text("Langue"),
            subtitle: const Text("Français"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Aller vers la sélection de langue
            },
          ),
          ListTile(
            title: const Text("Thème"),
            subtitle: const Text("Sombre"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Aller vers les paramètres de thème
            },
          ),
        ],
      ),
    );
  }
}
