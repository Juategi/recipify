import 'package:recipy/domain/repositories/favorites_repository.dart';

class GetFavoriteCase {
  final FavoritesRepository repository;
  GetFavoriteCase(this.repository);
  Future<List<String>> call() async {
    return await repository.getFavorites();
  }
}
