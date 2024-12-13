import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/calorie_entry.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const CalorieTrackerApp());
}

class CalorieTrackerApp extends StatelessWidget {
  const CalorieTrackerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CalorieEntryModel(),
      child: MaterialApp(
        title: 'Calorie Tracker',
        theme: ThemeData(
          primaryColor: const Color(0xFF96D4AF),
          scaffoldBackgroundColor: const Color(0xFFF6F9F8),
          appBarTheme: const AppBarTheme(
            color: Color(0xFF96D4AF),
            foregroundColor: Colors.white,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF96D4AF),
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(color: Color(0xFF96D4AF)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(color: Color(0xFF96D4AF)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(color: Color(0xFF96D4AF), width: 2.0),
            ),
            labelStyle: const TextStyle(color: Color(0xFF4B8072)),
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
