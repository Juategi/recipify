import 'package:recipy/domain/repositories/favorites_repository.dart';

class RemoveFavoriteCase {
  final FavoritesRepository repository;
  RemoveFavoriteCase(this.repository);
  Future<void> call(String id) async {
    return await repository.removeFavorite(id);
  }
}
