import 'package:flutter/material.dart';
import 'recipe_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final foodNameController = TextEditingController();

    void _searchRecipes() {
      final foodName = foodNameController.text.trim();
      if (foodName.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter a food name.')),
        );
        return;
      }

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RecipeScreen(foodName: foodName),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe Finder'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter the name of a food:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: foodNameController,
              decoration: const InputDecoration(
                labelText: 'Food Name (e.g., Pasta, Chicken)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: _searchRecipes,
                child: const Text('Search Recipes'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}