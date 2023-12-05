import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipy/domain/entities/recipe.dart';
import 'package:recipy/domain/usecases/get_recipes_case.dart';
import 'package:recipy/view/providers/repository_provider.dart';

final recipesListProvider = FutureProvider<List<Recipe>>((ref) async {
  GetRecipesCase getRecipesCase =
      GetRecipesCase(ref.watch(recipeRepositoryProvider));
  return getRecipesCase.call();
});
