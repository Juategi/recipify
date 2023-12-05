import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipy/domain/entities/recipe.dart';
import 'package:recipy/domain/usecases/get_recipe_case.dart';
import 'package:recipy/view/providers/repository_provider.dart';

final recipeProvider = FutureProvider.family<Recipe, String>((ref, id) async {
  GetRecipeCase getRecipeCase =
      GetRecipeCase(ref.watch(recipeRepositoryProvider));
  return getRecipeCase.call(id);
});
