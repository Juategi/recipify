import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:recipy/domain/entities/recipe.dart';
import 'package:recipy/domain/usecases/get_recipes_case.dart';

final recipesListProvider = FutureProvider<List<Recipe>>((ref) async {
  GetRecipesCase getRecipesCase = GetIt.I<GetRecipesCase>();
  return getRecipesCase.call();
});
