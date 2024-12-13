import 'package:flutter/material.dart';

class CalorieEntry {
  final String description;
  final int calories;

  CalorieEntry({required this.description, required this.calories});
}

class CalorieEntryModel extends ChangeNotifier {
  final List<CalorieEntry> _entries = [];

  List<CalorieEntry> get entries => _entries;

  int get totalCalories => _entries.fold(0, (sum, entry) => sum + entry.calories);

  void addEntry(String description, int calories) {
    _entries.add(CalorieEntry(description: description, calories: calories));
    notifyListeners();
  }
}
