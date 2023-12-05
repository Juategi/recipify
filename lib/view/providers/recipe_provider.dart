import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:recipy/domain/entities/recipe.dart';
import 'package:recipy/domain/usecases/get_recipe_case.dart';

final recipeProvider = FutureProvider.family<Recipe, String>((ref, id) async {
  GetRecipeCase getRecipeCase = GetIt.I<GetRecipeCase>();
  return getRecipeCase.call(id);
});
