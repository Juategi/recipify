import 'package:recipy/data/services/favorites_service.dart';
import 'package:recipy/domain/repositories/favorites_repository.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesService favoritesService;
  FavoritesRepositoryImpl({required this.favoritesService});

  @override
  Future<List<String>> getFavorites() async {
    return await favoritesService.getFavorites();
  }

  @override
  Future<void> addFavorite(String id) async {
    return await favoritesService.addFavorite(id);
  }

  @override
  Future<void> removeFavorite(String id) async {
    return await favoritesService.removeFavorite(id);
  }
}
