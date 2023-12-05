import 'dart:convert';

import 'package:recipy/data/http_client.dart';
import 'package:recipy/data/models/recipe_request.dart';

class RecipesService {
  final HttpClient httpClient;
  RecipesService({required this.httpClient});
  Future<List<RecipeRequest>> getRecipes() async {
    String response = await httpClient.get(
        endpoint: '/recipes', errorText: 'Error getting recipes');
    return (jsonDecode(response) as List<dynamic>)
        .map((e) => RecipeRequest.fromJson(e))
        .toList();
  }

  Future<RecipeRequest> getRecipe(String id) async {
    String response = await httpClient.get(
        endpoint: '/recipes/$id', errorText: 'Error getting recipe');
    return RecipeRequest.fromJson(jsonDecode(response));
  }
}
