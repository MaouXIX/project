import 'package:flutter/material.dart';
import '../services/api_service.dart';

class RecipeScreen extends StatelessWidget {
  final String foodName;

  const RecipeScreen({Key? key, required this.foodName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes for $foodName'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: ApiService().fetchRecipes(foodName),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No recipes found.'));
          }

          final recipes = snapshot.data!;
          return ListView.builder(
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              final recipe = recipes[index];
              return Card(
                child: ListTile(
                  title: Text(recipe['label']),
                  subtitle: Text('Calories: ${recipe['calories'].toStringAsFixed(0)}'),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    // Navigate to recipe details (optional)
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}