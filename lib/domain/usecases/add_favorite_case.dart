import 'package:recipy/domain/repositories/favorites_repository.dart';

class AddFavoriteCase {
  final FavoritesRepository repository;
  AddFavoriteCase(this.repository);
  Future<void> call(String id) async {
    return await repository.addFavorite(id);
  }
}
