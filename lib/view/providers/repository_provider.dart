import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipy/data/favorites_repository_impl.dart';
import 'package:recipy/data/recipe_repository_impl.dart';
import 'package:recipy/domain/repositories/favorites_repository.dart';
import 'package:recipy/domain/repositories/recipe_repository.dart';

final recipeRepositoryProvider = Provider<RecipeRepository>(
  (ref) => RecipeRepositoryImpl(),
);

final favoriteRepositoryProvider = Provider<FavoritesRepository>(
  (ref) => FavoritesRepositoryImpl(),
);
