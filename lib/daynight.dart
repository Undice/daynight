import 'package:flutter/material.dart';

class DayNight extends StatefulWidget {
  final Function whenDayChanges; // 🔄 Fonction callback pour changer le thème

  const DayNight({super.key, required this.whenDayChanges});

  @override
  State<DayNight> createState() => _DayNightState();
}

class _DayNightState extends State<DayNight> {
  bool _day = true; // 🌞 Mode jour par défaut

  // 🌓 Fonction pour basculer entre jour et nuit
  void _onPress() {
    setState(() {
      _day = !_day; // Change l'état du mode jour/nuit (true ⇄ false)
    });
    widget.whenDayChanges(); // 🔄 Appelle la fonction de `MainApp` pour changer le thème
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_day ? "Day" : "Night"), // Affiche le titre selon l'état (Day ⇄ Night)
      ),
      body: Center(
        child: Image.asset(_day ? "images/day.png" : "images/night.png"), // Affichage dynamique de l'image (day.png ⇄ night.png)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onPress, // Exécute `_onPress()` au clic
        child: Icon(_day ? Icons.night_shelter : Icons.light), // Change d'icône selon l'état (🌙 ⇄ ☀️)
      ),
    );
  }
}