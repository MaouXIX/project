import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String appId = '5132429d';
  final String appKey = '786aa1ee4e909a2ea10d7c013b5b21b7';
  final String baseUrl = 'https://api.edamam.com/search';

  Future<List<dynamic>> fetchRecipes(String foodName) async {
    final uri = Uri.parse('$baseUrl?q=$foodName&app_id=$appId&app_key=$appKey');

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['hits']
            .map<dynamic>((hit) => hit['recipe'])
            .toList(); // Extract recipe details
      } else {
        throw Exception('Failed to fetch recipes: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Failed to fetch recipes: $e');
    }
  }
}