import 'package:get_it/get_it.dart';
import 'package:recipy/data/http_client.dart';
import 'package:recipy/data/repositories/favorites_repository_impl.dart';
import 'package:recipy/data/repositories/recipe_repository_impl.dart';
import 'package:recipy/data/repositories/recipe_repository_mock.dart';
import 'package:recipy/data/services/favorites_service.dart';
import 'package:recipy/data/services/recipes_service.dart';
import 'package:recipy/domain/repositories/favorites_repository.dart';
import 'package:recipy/domain/repositories/recipe_repository.dart';
import 'package:recipy/domain/usecases/add_favorite_case.dart';
import 'package:recipy/domain/usecases/get_favorites_case.dart';
import 'package:recipy/domain/usecases/get_recipe_case.dart';
import 'package:recipy/domain/usecases/get_recipes_case.dart';
import 'package:recipy/domain/usecases/remove_favorite_case.dart';

class DependendyInjection {
  static void setUp() {
    final getIt = GetIt.instance;

    HttpClient httpClient = HttpClient();
    RecipesService recipesService = RecipesService(httpClient: httpClient);
    FavoritesService favoritesService = FavoritesService();

    //RecipeRepository recipeRepository = RecipeRepositoryImpl(recipesService: recipesService);
    RecipeRepository recipeRepository = RecipeRepositoryMock();
    FavoritesRepository favoritesRepository =
        FavoritesRepositoryImpl(favoritesService: favoritesService);

    getIt.registerLazySingleton<AddFavoriteCase>(
        () => AddFavoriteCase(favoritesRepository));
    getIt.registerLazySingleton<GetFavoriteCase>(
        () => GetFavoriteCase(favoritesRepository));
    getIt.registerLazySingleton<GetRecipeCase>(
        () => GetRecipeCase(recipeRepository));
    getIt.registerLazySingleton<GetRecipesCase>(
        () => GetRecipesCase(recipeRepository));
    getIt.registerLazySingleton<RemoveFavoriteCase>(
        () => RemoveFavoriteCase(favoritesRepository));
  }
}
