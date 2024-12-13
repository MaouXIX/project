import 'package:flutter/material.dart';
import '../models/recipe.dart';

class CalorieFilterScreen extends StatefulWidget {
  final String foodType;
  final List<Recipe> recipes;

  const CalorieFilterScreen({
    Key? key,
    required this.foodType,
    required this.recipes,
  }) : super(key: key);

  @override
  State<CalorieFilterScreen> createState() => _CalorieFilterScreenState();
}

class _CalorieFilterScreenState extends State<CalorieFilterScreen> {
  final minCaloriesController = TextEditingController();
  final maxCaloriesController = TextEditingController();

  List<Recipe> filteredRecipes = [];

  void _filterRecipes() {
    final minCalories = int.tryParse(minCaloriesController.text) ?? 0;
    final maxCalories = int.tryParse(maxCaloriesController.text) ?? double.infinity.toInt();

    setState(() {
      filteredRecipes = widget.recipes
          .where((recipe) => recipe.calories >= minCalories && recipe.calories <= maxCalories)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter Recipes for ${widget.foodType}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: minCaloriesController,
              decoration: const InputDecoration(labelText: 'Min Calories'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: maxCaloriesController,
              decoration: const InputDecoration(labelText: 'Max Calories'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _filterRecipes,
              child: const Text('Apply Filter'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: filteredRecipes.length,
                itemBuilder: (context, index) {
                  final recipe = filteredRecipes[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: Image.network(recipe.imageUrl, width: 50, height: 50),
                      title: Text(recipe.label),
                      subtitle: Text('${recipe.calories} cal'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}