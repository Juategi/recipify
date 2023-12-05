import 'package:recipy/data/mappers/recipe_mapper.dart';
import 'package:recipy/data/models/recipe_request.dart';
import 'package:recipy/data/services/recipes_service.dart';
import 'package:recipy/domain/entities/recipe.dart';
import 'package:recipy/domain/repositories/recipe_repository.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipesService recipesService;
  RecipeRepositoryImpl({required this.recipesService});
  @override
  Future<List<Recipe>> getRecipes() async {
    List<RecipeRequest> recipeRequests = await recipesService.getRecipes();
    List<Recipe> recipes =
        recipeRequests.map((e) => RecipeMapper.fromRequest(e)).toList();
    return recipes;
  }

  @override
  Future<Recipe> getRecipe(String id) async {
    RecipeRequest recipeRequest = await recipesService.getRecipe(id);
    return RecipeMapper.fromRequest(recipeRequest);
  }
}
