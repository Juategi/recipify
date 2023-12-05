import 'package:recipy/domain/entities/recipe.dart';
import 'package:recipy/domain/repositories/recipe_repository.dart';

class GetRecipeCase {
  final RecipeRepository repository;
  GetRecipeCase(this.repository);
  Future<Recipe> call(String id) async {
    return await repository.getRecipe(id);
  }
}
