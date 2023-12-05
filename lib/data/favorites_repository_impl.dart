import 'package:recipy/data/favorites_service.dart';
import 'package:recipy/domain/repositories/favorites_repository.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesService _favoritesService = FavoritesService();

  @override
  Future<List<String>> getFavorites() async {
    return await _favoritesService.getFavorites();
  }

  @override
  Future<void> addFavorite(String id) async {
    return await _favoritesService.addFavorite(id);
  }

  @override
  Future<void> removeFavorite(String id) async {
    return await _favoritesService.removeFavorite(id);
  }
}
