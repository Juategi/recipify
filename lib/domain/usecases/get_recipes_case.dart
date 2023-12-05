import 'package:recipy/domain/entities/recipe.dart';
import 'package:recipy/domain/repositories/recipe_repository.dart';

class GetRecipesCase {
  final RecipeRepository repository;
  GetRecipesCase(this.repository);
  Future<List<Recipe>> call() async {
    return await repository.getRecipes();
  }
}
