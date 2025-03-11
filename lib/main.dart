import 'package:flutter/material.dart';
import 'daynight.dart'; // Importation du fichier

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
  );

  final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.grey,
  );

  late ThemeData _selectedTheme;

  @override
  void initState() {
    super.initState();
    _selectedTheme = lightTheme; // L'application démarre avec le mode clair
  }

  // 🔄 **Méthode pour basculer entre mode clair et sombre**
  void _toggleTheme() {
    setState(() {
      _selectedTheme = (_selectedTheme == lightTheme) ? darkTheme : lightTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _selectedTheme, // Applique le thème dynamique
      home: DayNight(whenDayChanges: _toggleTheme), // Passe `_toggleTheme` à `DayNight` (lightTheme ⇄ darkTheme)
    );
  }
}
